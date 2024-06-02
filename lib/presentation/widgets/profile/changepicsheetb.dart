import 'package:flutter/material.dart';
import 'package:instagram_clone/core/constants/colors.dart';

class ChangePicSheetB extends StatelessWidget {
  final void Function()? uploadPhoto;
  final void Function()? deletePhoto;
  const ChangePicSheetB(
      {super.key, required this.uploadPhoto, required this.deletePhoto});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: MyColors.secondary2, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Change Profile Photo",
              style: TextStyle(color: MyColors.secondary1, fontSize: 26),
            ),
            const Divider(color: MyColors.secondary1),
            InkWell(
                onTap: uploadPhoto,
                child: const CustomTextSheetB(
                  data: "Upload Photo",
                  color: Colors.blue,
                )),
            const Divider(color: MyColors.secondary1),
            InkWell(
                onTap: deletePhoto,
                child: const CustomTextSheetB(
                  data: "Remove Current Photo",
                  color: Colors.red,
                )),
            const Divider(color: MyColors.secondary1),
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const CustomTextSheetB(
                    data: "Cancel", color: MyColors.secondary1)),
          ],
        ),
      ),
    );
  }
}

class CustomTextSheetB extends StatelessWidget {
  final String data;
  final Color? color;
  const CustomTextSheetB({super.key, required this.data, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(color: color, fontSize: 20),
    );
  }
}
