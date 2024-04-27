import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/links.dart';

import '../../../constants/colors.dart';
import '../../../constants/images.dart';
import '../../../data/models/mainposts.dart';

class CustomPostHomePageWidget extends StatelessWidget {
  final List<MainPosts> mainPosts;
  const CustomPostHomePageWidget({super.key, required this.mainPosts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: mainPosts.length,
        itemBuilder: (context, index) => Container(
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
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: MyColors.secondary2),
                          child: Image.asset(
                            Myimages.profile,
                            height: 40,
                            width: 40,
                            fit: BoxFit.fill,
                          )),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          mainPosts[index].usersName!,
                          style: TextStyle(
                              fontSize: 20, color: MyColors.secondary1),
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
                        MyLink.Posts + mainPosts[index].postsUrl!,
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
                      Spacer(),
                      CustomPostIconButton(
                        icon: Icons.bookmark_border_outlined,
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ));
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
