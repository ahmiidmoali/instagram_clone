import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/bussiness_logic/comment/cubit/comment_cubit.dart';
import 'package:instagram_clone/bussiness_logic/posts/cubit/addposts_cubit.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/data/models/allcomments.dart';
import 'package:instagram_clone/presentation/widgets/homepage/custom_post_homepage_widget.dart';

import '../../../core/constants/images.dart';
import '../../../core/constants/links.dart';
import '../../../core/constants/sharedkeys.dart';
import '../../../main.dart';
import '../addpost/customcaptionformfield.dart';

class CustomAddCommentsheetButton extends StatefulWidget {
  final String postid;
  final void Function()? onPressed;

  const CustomAddCommentsheetButton(
      {super.key, required this.onPressed, required this.postid});

  @override
  State<CustomAddCommentsheetButton> createState() =>
      _CustomAddCommentsheetButtonState();
}

class _CustomAddCommentsheetButtonState
    extends State<CustomAddCommentsheetButton> {
  GlobalKey<FormState> commentformstate = GlobalKey<FormState>();
  String mainid = sharedPreferences.getString(SharedKeys.id) ?? "0";
  String mypic = sharedPreferences.getString(SharedKeys.myPic) ?? "null";
  TextEditingController? commentcontroller;
  List<AllComments> allComments = [];
  init() async {
    await BlocProvider.of<CommentCubit>(context).getAllComment(widget.postid);
  }

  addComment(String userid) async {
    if (commentformstate.currentState!.validate()) {
      await BlocProvider.of<CommentCubit>(context)
          .addComment(userid, commentcontroller!.text, widget.postid);
    }
  }

  @override
  void initState() {
    init();
    commentcontroller = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.secondary2,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16)
            .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 350,
              child: BlocConsumer<CommentCubit, CommentState>(
                listener: (context, state) {
                  if (state is CommentAddDone) {
                    init();
                    if (commentcontroller!.text.isNotEmpty) {
                      commentcontroller!.clear();
                    }
                  }
                },
                builder: (context, state) {
                  if (state is CommentLoaded) {
                    allComments = state.allComments;
                    return ListView(
                      children: [
                        ...List.generate(
                            allComments.length,
                            (index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: allComments[index]
                                                      .usersProfilepic ==
                                                  "null"
                                              ? Image.asset(
                                                  Myimages.profile,
                                                  width: 30,
                                                  height: 30,
                                                  fit: BoxFit.cover,
                                                )
                                              : CachedNetworkImage(
                                                  imageUrl: MyLink.imagesLink +
                                                      allComments[index]
                                                          .usersProfilepic!,
                                                  width: 50,
                                                  height: 50,
                                                  fit: BoxFit.cover,
                                                )),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  allComments[index]
                                                      .usersFullname!,
                                                  style: const TextStyle(
                                                      color:
                                                          MyColors.secondary1),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                const Text("time",
                                                    style: TextStyle(
                                                        color: MyColors
                                                            .secondary1))
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: SizedBox(
                                              width: 300,
                                              child: Text(
                                                allComments[index]
                                                    .commentsContent!,
                                                style: const TextStyle(
                                                    color: MyColors.secondary1,
                                                    overflow:
                                                        TextOverflow.visible),
                                                maxLines: null,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )),
                      ],
                    );
                  }
                  return Center(
                    child: Text("no comments yet"),
                  );
                },
              ),
            ),
            Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: mypic == "null"
                        ? Image.asset(
                            Myimages.profile,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                        : CachedNetworkImage(
                            imageUrl: MyLink.imagesLink + mypic,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )),
                Expanded(
                  child: Form(
                    key: commentformstate,
                    child: CustomCaptionFormField(
                      hintText: "Add comment",
                      controller: commentcontroller,
                    ),
                  ),
                ),
                CustomPostIconButton(
                  icon: Icons.arrow_circle_up_outlined,
                  onPressed: () {
                    addComment(mainid);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
