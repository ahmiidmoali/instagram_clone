import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';

class CustomPicsVediosTagsWidget extends StatelessWidget {
  final IconData? icon;
  final bool isActive;
  const CustomPicsVediosTagsWidget(
      {super.key, required this.icon, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: isActive ? MyColors.secondary1 : MyColors.background,
                  width: 5))),
      child: Icon(
        icon,
        size: 30,
        color: isActive
            ? MyColors.secondary1
            : MyColors.secondary1.withOpacity(.7),
      ),
    );
  }
}
