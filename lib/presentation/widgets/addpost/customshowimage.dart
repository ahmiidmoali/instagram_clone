import 'dart:io';

import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/images.dart';

class CustomShowImage extends StatelessWidget {
  final File? image;
  const CustomShowImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: (image != null)
          ? Container(
              color: MyColors.secondary2,
              height: 350,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.file(
                image!,
                fit: BoxFit.contain,
              ),
            )
          : Container(
              color: MyColors.secondary2,
              height: 350,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                Myimages.loginlogo,
                fit: BoxFit.contain,
              )),
    );
  }
}
