import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/bussiness_logic/posts/cubit/posts_cubit.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/constants/images.dart';
import 'package:instagram_clone/core/constants/links.dart';
import 'package:instagram_clone/core/shared/loadingscreen.dart';
import 'package:instagram_clone/data/models/posts.dart';

import '../../../core/constants/sharedkeys.dart';

import '../../../main.dart';
import '../../widgets/homepage/custom_post_homepage_widget.dart';
import '../../widgets/profile/custom_mid_button_profile.dart';
import '../../widgets/profile/custom_pics_vedios_tags.dart';
import '../../widgets/profile/customfollowing_posts_for_profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    late List<Posts> allPosts;
    String posts = sharedPreferences.getString(SharedKeys.posts) ?? "0";
    String followers = sharedPreferences.getString(SharedKeys.followers) ?? "0";
    String following = sharedPreferences.getString(SharedKeys.following) ?? "0";
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            //------------pic & followers & following--------------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: MyColors.secondary2),
                    child: Image.asset(
                      Myimages.profile,
                      height: 100,
                      width: 100,
                      fit: BoxFit.fill,
                    )),
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
            //------------------name-------------------
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "ahmed ali",
                style: TextStyle(fontSize: 20, color: MyColors.secondary1),
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
                  return const LoadingScreen();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
