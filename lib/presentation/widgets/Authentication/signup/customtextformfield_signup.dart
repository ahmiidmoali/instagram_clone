import 'package:flutter/material.dart';
import 'package:instagram_clone/core/constants/colors.dart';

class CustomTextFormFieldSignup extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String hintText;
  const CustomTextFormFieldSignup(
      {super.key,
      required this.hintText,
      required this.validator,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: MyColors.secondary1,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(
                color: Colors.grey,
                style: BorderStyle.solid,
              )),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          hintText: hintText,
        ),
      ),
    );
  }
}
