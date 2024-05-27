import 'package:flutter/material.dart';

import 'package:instagram_clone/data/models/mainposts.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/images.dart';
import '../../../core/constants/links.dart';
import '../../../core/constants/routes.dart';

import '../../widgets/homepage/custom_post_homepage_widget.dart';

class PostDetails extends StatelessWidget {
  final MainPosts mainPosts;
  const PostDetails({super.key, required this.mainPosts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Explore",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: MyColors.secondary1),
          ),
          backgroundColor: MyColors.background,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: MyColors.secondary1,
              ))),
      backgroundColor: MyColors.background,
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          //------------add &view stories--------------------
          Container(
            color: MyColors.background,
            height: 400,
            width: double.infinity,
            child: Column(
              children: [
                //--------pic&name&icon_for_bottomSheet---------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: .8),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, MyRoutes.profileScreen,
                              arguments: mainPosts);
                        },
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: mainPosts.usersProfilepic == "null"
                                  ? Image.asset(
                                      Myimages.profile,
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      MyLink.imagesLink +
                                          mainPosts.usersProfilepic!,
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              mainPosts.usersFullname!,
                              style: const TextStyle(
                                  fontSize: 20, color: MyColors.secondary1),
                            ),
                          ],
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
                    child: Image.network(
                      MyLink.imagesLink + mainPosts.postsUrl!,
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    )),
                //--------react_On_ThePost_Icons---------
                Row(
                  children: [
                    CustomPostIconButton(
                      icon: Icons.favorite_border_outlined,
                      onPressed: () {},
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
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
