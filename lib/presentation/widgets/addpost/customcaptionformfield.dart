import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/functions/validinput.dart';

class CustomCaptionFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  const CustomCaptionFormField(
      {super.key, required this.controller, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: TextFormField(
      controller: controller,
      validator: (value) {
        return validInput(value!, 1, 255, Validtype.somthingelse);
      },
      maxLines: 5,
      minLines: 1,
      style: const TextStyle(color: MyColors.secondary1),
      decoration: InputDecoration(
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: MyColors.background),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          hintText: hintText,
          hintStyle: const TextStyle(color: MyColors.secondary1)),
    ));
  }
}
