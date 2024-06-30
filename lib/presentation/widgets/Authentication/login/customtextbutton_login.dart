import 'package:flutter/material.dart';
import 'package:instagram_clone/core/constants/colors.dart';

class CustomTextButtonLogin extends StatelessWidget {
  final Function()? onPressed;
  final String data;
  const CustomTextButtonLogin(
      {super.key, required this.onPressed, required this.data});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(
        data,
        style: const TextStyle(fontSize: 15, color: MyColors.secondary1),
      ),
    );
  }
}
