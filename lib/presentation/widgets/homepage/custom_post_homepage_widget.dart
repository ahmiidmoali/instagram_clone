import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/bussiness_logic/likepost/cubit/like_post_cubit.dart';
import 'package:instagram_clone/core/constants/links.dart';
import 'package:instagram_clone/core/constants/routes.dart';
import 'package:instagram_clone/data/models/allcomments.dart';
import 'package:instagram_clone/presentation/widgets/homepage/custom_addcomment.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/images.dart';
import '../../../core/constants/sharedkeys.dart';
import '../../../data/models/mainposts.dart';
import '../../../main.dart';
import 'package:instagram_clone/bussiness_logic/comment/cubit/comment_cubit.dart';

class CustomPostHomePageWidget extends StatelessWidget {
  final List<MainPosts> mainPosts;
  const CustomPostHomePageWidget({super.key, required this.mainPosts});

  @override
  Widget build(BuildContext context) {
    String mainid = sharedPreferences.getString(SharedKeys.id) ?? "0";
    String mypic = sharedPreferences.getString(SharedKeys.myPic) ?? "null";

    Map favourites = {};
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: mainPosts.length,
        itemBuilder: (context, index) {
          String isLiked = mainPosts[index].favourites.toString();
          favourites[mainPosts[index].postsId] = mainPosts[index].favourites;
          return Container(
            color: MyColors.background,
            width: double.infinity,
            child: Column(
              children: [
                //--------pic&name&icon_for_bottomSheet---------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: mainPosts[index].usersProfilepic == "null"
                            ? Image.asset(
                                Myimages.profile,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              )
                            : CachedNetworkImage(
                                imageUrl: MyLink.imagesLink +
                                    mainPosts[index].usersProfilepic!,
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, MyRoutes.otherprofileScreen,
                              arguments: mainPosts[index].usersId.toString());
                        },
                        child: Text(
                          mainPosts[index].usersName!,
                          style: const TextStyle(
                              fontSize: 20, color: MyColors.secondary1),
                        ),
                      ),
                    ),
                    const Spacer(),
                    CustomPostIconButton(
                      icon: Icons.more_vert,
                      onPressed: () {},
                    ),
                  ],
                ),
                //--------picOfThePost---------
                Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    height: 250,
                    color: MyColors.secondary2,
                    child: CachedNetworkImage(
                      imageUrl: MyLink.imagesLink + mainPosts[index].postsUrl!,
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    )),
                //--------react_On_ThePost_Icons---------
                Row(
                  children: [
                    BlocBuilder<LikePostCubit, LikePostState>(
                      builder: (context, state) {
                        return CustomPostLikeIconButton(
                          onPressed: () async {
                            await BlocProvider.of<LikePostCubit>(context)
                                .likePostTry(mainid,
                                    mainPosts[index].postsId.toString());

                            if (favourites[mainPosts[index].postsId] == 1) {
                              favourites[mainPosts[index].postsId] = 0;
                            } else if (favourites[mainPosts[index].postsId] ==
                                0) {
                              favourites[mainPosts[index].postsId] = 1;
                            }
                          },
                          isliked:
                              favourites[mainPosts[index].postsId].toString(),
                        );
                      },
                    ),
                    CustomPostIconButton(
                      icon: Icons.mode_comment_outlined,
                      onPressed: () {},
                    ),
                    CustomPostIconButton(
                      icon: Icons.send,
                      onPressed: () {},
                    ),
                    const Spacer(),
                    CustomPostIconButton(
                      icon: Icons.bookmark_border_outlined,
                      onPressed: () {},
                    ),
                  ],
                ),
                //view comments
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "View all comments",
                      style:
                          TextStyle(fontSize: 15, color: MyColors.secondary4),
                    ),
                  ),
                ),
                //add comment
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: mainPosts[index].usersProfilepic == "null"
                            ? Image.asset(
                                Myimages.profile,
                                width: 25,
                                height: 25,
                                fit: BoxFit.cover,
                              )
                            : CachedNetworkImage(
                                imageUrl: MyLink.imagesLink + mypic,
                                width: 25,
                                height: 25,
                                fit: BoxFit.cover,
                              )),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: .8),
                      child: InkWell(
                        onTap: () {
                          showBottomSheet(
                              enableDrag: true,
                              backgroundColor: MyColors.background,
                              context: context,
                              builder: (context) => CustomAddCommentsheetButton(
                                    postid: mainPosts[index].postsId.toString(),
                                    onPressed: () {},
                                  ));
                        },
                        child: const Text(
                          "Add a comment..",
                          style: TextStyle(
                              fontSize: 15, color: MyColors.secondary4),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          );
        });
  }
}

class CustomPostIconButton extends StatelessWidget {
  final IconData? icon;

  final void Function()? onPressed;

  const CustomPostIconButton(
      {super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: MyColors.secondary1,
        ));
  }
}

class CustomPostLikeIconButton extends StatelessWidget {
  final String isliked;

  final void Function()? onPressed;

  const CustomPostLikeIconButton(
      {super.key, required this.onPressed, required this.isliked});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: Icon(
          isliked == "0"
              ? Icons.favorite_border_outlined
              : Icons.favorite_outlined,
          color: isliked == "0" ? MyColors.secondary1 : Colors.red,
        ));
  }
}
