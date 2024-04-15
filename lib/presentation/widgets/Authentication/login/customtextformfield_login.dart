import 'package:flutter/material.dart';

class CustomTextFormFieldLogin extends StatelessWidget {
  final String hintText;
  const CustomTextFormFieldLogin({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        decoration: InputDecoration(
            border: const OutlineInputBorder(), hintText: hintText),
      ),
    );
  }
}
