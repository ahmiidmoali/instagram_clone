import 'package:flutter/material.dart';
import 'package:instagram_clone/core/constants/colors.dart';

class CustomTextFormFieldLogin extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String hintText;
  const CustomTextFormFieldLogin(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          // color: MyColors.secondary1,
          borderRadius: BorderRadius.circular(5)),
      margin: const EdgeInsets.only(bottom: 5),
      child: TextFormField(
        validator: validator,
        controller: controller,
        // cursorColor: MyColors.secondary1,
        decoration: InputDecoration(
            filled: true,
            fillColor: MyColors.secondary1,
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.secondary1, width: 5)),
            hintText: hintText),
      ),
    );
  }
}
