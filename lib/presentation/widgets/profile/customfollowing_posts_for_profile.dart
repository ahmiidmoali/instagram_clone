import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';

class customFollowingPostsForProfile extends StatelessWidget {
  final String dataInt;
  final String dataString;
  const customFollowingPostsForProfile(
      {super.key, required this.dataInt, required this.dataString});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            dataInt,
            style: const TextStyle(fontSize: 30, color: MyColors.secondary1),
          ),
          Text(
            dataString,
            style: const TextStyle(fontSize: 12, color: MyColors.secondary1),
          ),
        ],
      ),
    );
  }
}
