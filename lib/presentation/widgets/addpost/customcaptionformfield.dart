import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/functions/validinput.dart';

class CustomCaptionFormField extends StatelessWidget {
  final TextEditingController? controller;
  const CustomCaptionFormField({super.key, required this.controller});

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
      decoration: const InputDecoration(
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: MyColors.background),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          hintText: "Write a Caption",
          hintStyle: TextStyle(color: MyColors.secondary1)),
    ));
  }
}
