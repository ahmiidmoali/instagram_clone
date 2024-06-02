import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/images.dart';
import '../../../core/constants/links.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomStoryGenerator extends StatelessWidget {
  final String mypic;
  const CustomStoryGenerator({super.key, required this.mypic});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: mypic == "null"
                    ? Image.asset(
                        Myimages.profile,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      )
                    : CachedNetworkImage(
                        imageUrl: MyLink.imagesLink + mypic,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      )),
            const Text(
              "your story",
              style: TextStyle(fontSize: 20, color: MyColors.secondary1),
            ),
          ],
        ),
        const Spacer()
      ],
    );
  }
}
