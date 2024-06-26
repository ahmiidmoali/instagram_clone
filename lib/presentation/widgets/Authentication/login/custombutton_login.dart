import 'package:flutter/material.dart';
import 'package:instagram_clone/core/constants/colors.dart';

class CustomButtonLogin extends StatelessWidget {
  final Function()? onPressed;
  final String nameOfButton;
  const CustomButtonLogin(
      {super.key, required this.onPressed, required this.nameOfButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: MyColors.secondary1),
      child: MaterialButton(
        onPressed: onPressed,
        child: Container(
          alignment: Alignment.center,
          height: 45,
          width: double.infinity,
          child: Text(
            nameOfButton,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, color: MyColors.background),
          ),
        ),
      ),
    );
  }
}
