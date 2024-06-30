import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/bussiness_logic/posts/cubit/addposts_cubit.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import '../../../core/constants/sharedkeys.dart';
import '../../../core/functions/uploadfile.dart';
import '../../../main.dart';
import '../../widgets/addpost/customactionpostbutton.dart';
import '../../widgets/addpost/customcameraorgallery.dart';
import '../../widgets/addpost/customcaptionformfield.dart';
import '../../widgets/addpost/customshowimage.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  late TextEditingController captionController;
  String myid = sharedPreferences.getString(SharedKeys.id) ?? "0";
  File? image;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
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
    if (formstate.currentState!.validate()) {
      BlocProvider.of<AddPostsCubit>(context).addPost({
        "id": myid,
        "posts_disc": captionController.text,
        "posts_type": "0",
        "posts_private": "0",
      }, image);
    }
  }

  @override
  void initState() {
    captionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    captionController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyColors.background,
        appBar: AppBar(
          title: const Text(
            "New Post",
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
            CustomActionPostButton(
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
            Form(
                key: formstate,
                child: CustomCaptionFormField(
                    hintText: "Write a Caption",
                    controller: captionController)),
          ],
        ));
  }
}
