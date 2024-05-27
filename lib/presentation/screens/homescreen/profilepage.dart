import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/bussiness_logic/posts/cubit/posts_cubit.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/constants/images.dart';
import 'package:instagram_clone/core/constants/links.dart';
import 'package:instagram_clone/core/constants/routes.dart';
import 'package:instagram_clone/core/shared/loadingscreen.dart';
import 'package:instagram_clone/data/models/posts.dart';
import 'package:instagram_clone/presentation/screens/homescreen/addpic.dart';

import '../../../core/constants/sharedkeys.dart';

import '../../../main.dart';
import '../../widgets/homepage/custom_post_homepage_widget.dart';
import '../../widgets/profile/changepicsheetb.dart';
import '../../widgets/profile/custom_mid_button_profile.dart';
import '../../widgets/profile/custom_pics_vedios_tags.dart';
import '../../widgets/profile/customfollowing_posts_for_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    late List<Posts> allPosts;
    String posts = sharedPreferences.getString(SharedKeys.posts) ?? "0";
    String username =
        sharedPreferences.getString(SharedKeys.myusername) ?? "     ";
    String followers = sharedPreferences.getString(SharedKeys.followers) ?? "0";
    String following = sharedPreferences.getString(SharedKeys.following) ?? "0";
    String myPic = sharedPreferences.getString(SharedKeys.myPic) ?? "null";
    return Scaffold(
      backgroundColor: MyColors.background,
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          //------------pic & followers & following--------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: myPic == "null"
                        ? Image.asset(
                            Myimages.profile,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            MyLink.imagesLink + myPic,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                  ),
                  Positioned(
                      top: 0,
                      right: -15,
                      child: IconButton(
                        onPressed: () {
                          showBottomSheet(
                            backgroundColor: MyColors.background,
                            context: context,
                            builder: (context) => ChangePicSheetB(
                              uploadPhoto: () {
                                Navigator.of(context)
                                    .pushNamed(MyRoutes.profilePic);
                              },
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.add_a_photo_outlined,
                          size: 30,
                          color: MyColors.secondary1,
                        ),
                      ))
                ],
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
              )
            ],
          ),
          //---name---
          Padding(
            padding: const EdgeInsets.symmetric(vertical: .8),
            child: Text(
              username,
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 20, color: MyColors.secondary1),
            ),
          ),

          //------------------Edit profile & Share profile-------------------
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(),
              const customMidButtonProfile(data: "Edit profile"),
              const customMidButtonProfile(data: "Share profile"),
              Expanded(
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.person_add_alt_sharp,
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
          BlocBuilder<PostsCubit, PostsState>(
            builder: (context, state) {
              if (state is PostsLoaded) {
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
                        color: MyColors.secondary2,
                        child: Image.network(
                          MyLink.imagesLink + allPosts[index].postsUrl!,
                          height: 100,
                          width: 100,
                          fit: BoxFit.fill,
                        )));
              } else {
                return const LoadingScreen(
                  width: 50,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
