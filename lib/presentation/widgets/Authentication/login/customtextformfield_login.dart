import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';

class CustomTextFormFieldLogin extends StatelessWidget {
  final String hintText;
  const CustomTextFormFieldLogin({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: MyColors.secondary1, borderRadius: BorderRadius.circular(5)),
      margin: EdgeInsets.only(bottom: 5),
      child: TextFormField(
        // cursorColor: MyColors.secondary1,
        decoration: InputDecoration(
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.secondary1, width: 5)),
            hintText: hintText),
      ),
    );
  }
}
