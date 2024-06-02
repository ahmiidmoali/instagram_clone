import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class CustomCameraorGallery extends StatelessWidget {
  final Function()? chooseCamera;
  final Function()? chooseGallery;

  const CustomCameraorGallery(
      {super.key, required this.chooseCamera, required this.chooseGallery});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          const Text(
            "Recents",
            style: TextStyle(fontSize: 30, color: MyColors.secondary1),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.expand_more_outlined,
                  size: 30, color: MyColors.secondary1)),
          const Spacer(),
          IconButton(
              onPressed: chooseCamera,
              icon: const Icon(Icons.add_a_photo_outlined,
                  size: 30, color: MyColors.secondary1)),
          IconButton(
              onPressed: chooseGallery,
              icon: const Icon(Icons.add_to_photos_outlined,
                  size: 30, color: MyColors.secondary1)),
        ],
      ),
    );
  }
}
