import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/links.dart';
import '../../../data/models/mainposts.dart';

class CustomPostsGrid extends StatelessWidget {
  final List<MainPosts> allPosts;
  const CustomPostsGrid({super.key, required this.allPosts});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 3, mainAxisSpacing: 3, crossAxisCount: 3),
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
  }
}
