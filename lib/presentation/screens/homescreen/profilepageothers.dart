import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/bussiness_logic/follow/cubit/follow_cubit.dart';
import 'package:instagram_clone/bussiness_logic/posts/cubit/posts_cubit.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/constants/images.dart';
import 'package:instagram_clone/core/constants/links.dart';
import 'package:instagram_clone/core/shared/loadingscreen.dart';
import 'package:instagram_clone/data/models/allusers.dart';
import 'package:instagram_clone/data/models/posts.dart';

import '../../../bussiness_logic/posts/cubit/postsothers_cubit.dart';
import '../../../core/constants/sharedkeys.dart';

import '../../../data/models/mainposts.dart';
import '../../../main.dart';
import '../../widgets/homepage/custom_post_homepage_widget.dart';
import '../../widgets/profile/custom_mid_button_profile.dart';
import '../../widgets/profile/custom_pics_vedios_tags.dart';
import '../../widgets/profile/customfollowing_posts_for_profile.dart';

class ProfilePageOthers extends StatefulWidget {
  final String usersId;
  const ProfilePageOthers({
    super.key,
    required this.usersId,
  });

  @override
  State<ProfilePageOthers> createState() => _ProfilePageOthersState();
}

class _ProfilePageOthersState extends State<ProfilePageOthers> {
  String mainid = sharedPreferences.getString(SharedKeys.id) ?? "0";

  init() async {
    await BlocProvider.of<PostsothersCubit>(context)
        .getAllPostsOthers(widget.usersId.toString(), mainid);
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late List<Posts> allPosts;
    late List<AllUsers> user;
    String isFollowed = BlocProvider.of<PostsothersCubit>(context).isFollowed;
    String posts = "0";
    String followers = "0";
    String following = "0";
    String picname = "null";
    String username = "       ";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.background,
        leadingWidth: 150,
        actions: [
          CustomPostIconButton(
            icon: Icons.favorite_border_outlined,
            onPressed: () {},
          ),
          CustomPostIconButton(
            icon: Icons.messenger_outline_outlined,
            onPressed: () {
              setState(() {});
            },
          )
        ],
        leading: Row(
          children: [
            Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                ),
                child: Image.asset(
                  Myimages.loginlogo,
                  width: 100,
                  height: 50,
                  color: MyColors.secondary1,
                  fit: BoxFit.fill,
                )),
            Expanded(
              child: CustomPostIconButton(
                icon: Icons.expand_more_outlined,
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
      backgroundColor: MyColors.background,
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          //------------pic & followers & following--------------------
          BlocBuilder<PostsothersCubit, PostsothersState>(
            builder: (context, state) {
              if (state is PostsothersLoaded) {
                posts = state.postscount.toString();
                followers = state.followers.toString();
                following = state.following.toString();
                user = state.user;
                picname = user[0].usersProfilepic ?? "null";
                username = user[0].usersName ?? "     ";
                isFollowed = state.isFollowed;
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: picname == "null"
                            ? Image.asset(
                                Myimages.profile,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                MyLink.imagesLink + user[0].usersProfilepic!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                      ),
                      Row(
                        children: [
                          customFollowingPostsForProfile(
                            dataInt: posts,
                            dataString: "Posts",
                          ),
                          customFollowingPostsForProfile(
                            dataInt: followers,
                            dataString: "Followers",
                          ),
                          customFollowingPostsForProfile(
                            dataInt: following,
                            dataString: "Following",
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      username,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 20, color: MyColors.secondary1),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              );
            },
          ),
          //------------------Edit profile & Share profile-------------------
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(),
              BlocBuilder<PostsothersCubit, PostsothersState>(
                  builder: (context, state) {
                if (state is PostsothersLoaded) {
                  isFollowed = state.isFollowed;
                }

                return customFollowButtonProfile(
                  data: "Follow",
                  data2: "Following",
                  isFollowed: isFollowed,
                  onPressed: () async {
                    if (isFollowed == "0") {
                      await BlocProvider.of<FollowCubit>(context)
                          .followAddTry(mainid, widget.usersId.toString());
                      isFollowed = "1";
                    } else if (isFollowed == "1") {
                      await BlocProvider.of<FollowCubit>(context)
                          .followRemoveTry(mainid, widget.usersId.toString());
                      isFollowed = "0";
                    }
                  },
                );
              }),
              const customMidButtonProfile(data: "Share profile"),
              Expanded(
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      isFollowed == "0"
                          ? Icons.person_add_alt_sharp
                          : Icons.person,
                      size: 20,
                      color: MyColors.secondary1,
                    )),
              )
            ],
          )
          //------------------pics & vedios & tags-------------------
          ,
          const SizedBox(
            height: 30,
          ),
          Row(
            children: const [
              Expanded(
                  child: CustomPicsVediosTagsWidget(
                icon: Icons.grid_on_outlined,
                isActive: true,
              )),
              Expanded(
                  child: CustomPicsVediosTagsWidget(
                icon: Icons.video_collection_outlined,
                isActive: false,
              )),
              Expanded(
                  child: CustomPicsVediosTagsWidget(
                icon: Icons.person_pin_outlined,
                isActive: false,
              ))
            ],
          ),
          //------------------all generated pics & vedios & tags-------------------
          BlocBuilder<PostsothersCubit, PostsothersState>(
            builder: (context, state) {
              if (state is PostsothersLoaded) {
                allPosts = state.posts;

                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 3,
                            mainAxisSpacing: 3,
                            crossAxisCount: 3),
                    shrinkWrap: true,
                    itemCount: allPosts.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.all(1),
                        color: MyColors.secondary2,
                        child: Image.network(
                          MyLink.imagesLink + allPosts[index].postsUrl!,
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                        )));
              } else {
                return const Center(
                  child: Text(
                    "loading .............",
                    style: TextStyle(color: MyColors.secondary1),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
