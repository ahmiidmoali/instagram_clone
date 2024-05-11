import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/images.dart';

class CustomStoryGenerator extends StatelessWidget {
  const CustomStoryGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: MyColors.secondary2),
                child: Image.asset(
                  Myimages.profile,
                  height: 100,
                  width: 100,
                  fit: BoxFit.fill,
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
