import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/bussiness_logic/profilepic/cubit/profilepic_cubit.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import '../../../core/constants/sharedkeys.dart';
import '../../../core/functions/uploadfile.dart';
import '../../../main.dart';
import '../../widgets/addpost/customcameraorgallery.dart';
import '../../widgets/addpost/customshowimage.dart';
import '../../widgets/profilepic/customactionprofilepic.dart';

class AddPic extends StatefulWidget {
  const AddPic({super.key});

  @override
  State<AddPic> createState() => _AddPicState();
}

class _AddPicState extends State<AddPic> {
  String myid = sharedPreferences.getString(SharedKeys.id) ?? "0";
  File? image;

  chooseCamera() async {
    image = await imageUploadCamera();
    setState(() {});
  }

  chooseGallery() async {
    image = await imageUploadGallery();

    setState(() {});
  }

  addData() async {
    if (image == null) {
      return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "please choose the pic first",
          style: TextStyle(fontSize: 20, color: MyColors.secondary1),
        ),
      ));
    }

    BlocProvider.of<ProfilepicCubit>(context).addPic({
      "id": myid,
    }, image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.background,
        appBar: AppBar(
          title: const Text(
            "Profile Picture",
            style: TextStyle(fontSize: 30, color: MyColors.secondary1),
          ),
          backgroundColor: MyColors.background,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close_outlined,
                  size: 30, color: MyColors.secondary1)),
          actions: [
            CustomActionProfilePicButton(
              userid: myid,
              onTap: () {
                addData();
              },
            )
          ],
        ),
        body: ListView(
          children: [
            CustomShowImage(image: image),
            CustomCameraorGallery(
              chooseCamera: () {
                chooseCamera();
              },
              chooseGallery: () {
                chooseGallery();
              },
            ),
          ],
        ));
  }
}
