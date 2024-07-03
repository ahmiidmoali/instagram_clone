import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/data/models/allcomments.dart';
import 'package:jiffy/jiffy.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/images.dart';
import '../../../core/constants/links.dart';
import 'custom_post_homepage_widget.dart';

class CustomCommentDesign extends StatelessWidget {
  final AllComments allComments;
  const CustomCommentDesign({super.key, required this.allComments});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: allComments.usersProfilepic == "null"
                  ? Image.asset(
                      Myimages.profile,
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    )
                  : CachedNetworkImage(
                      imageUrl:
                          MyLink.imagesLink + allComments.usersProfilepic!,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    )),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      allComments.usersFullname!,
                      style: const TextStyle(color: MyColors.secondary1),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(Jiffy(allComments.commentsTime).fromNow(),
                        style: const TextStyle(color: MyColors.secondary4))
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                width: 300,
                child: Text(
                  allComments.commentsContent!,
                  style: const TextStyle(
                      color: MyColors.secondary1,
                      overflow: TextOverflow.visible),
                  maxLines: null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Reply",
                      style: TextStyle(color: MyColors.secondary4),
                    ),
                    const SizedBox(
                      width: 200,
                    ),
                    CustomPostLikeIconButton(onPressed: () {}, isliked: "0")
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
