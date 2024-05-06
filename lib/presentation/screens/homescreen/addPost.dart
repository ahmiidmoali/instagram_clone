import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/bussiness_logic/posts/cubit/addposts_cubit.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/constants/images.dart';
import 'package:instagram_clone/core/functions/validinput.dart';

import '../../../core/functions/uploadfile.dart';

class addPost extends StatefulWidget {
  const addPost({super.key});

  @override
  State<addPost> createState() => _addPostState();
}

class _addPostState extends State<addPost> {
  late TextEditingController captionController;
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
        "id": "5",
        "posts_disc": captionController.text,
        "posts_type": "0",
        "posts_private": "0",
      }, image);
    }
  }

  @override
  void initState() {
    captionController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    captionController.clear();

    // TODO: implement dispose
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
            BlocBuilder<AddPostsCubit, AddPostsState>(
              builder: (context, state) {
                // if (state is AddPostsLoading) {
                //   return 
                // }
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        addData();
                      },
                      child: const Text(
                        "Post",
                        style:
                            TextStyle(fontSize: 20, color: MyColors.secondary3),
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
        body: ListView(
          children: [
            if (image != null)
              Container(
                color: MyColors.secondary2,
                height: 350,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.file(
                  image!,
                  fit: BoxFit.contain,
                ),
              ),
            if (image == null)
              Container(
                  color: MyColors.secondary2,
                  height: 350,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset(
                    Myimages.post1,
                    fit: BoxFit.contain,
                  )),
            SizedBox(
              height: 60,
              child: Row(
                children: [
                  const Text(
                    "Recents",
                    style: TextStyle(fontSize: 30, color: MyColors.secondary1),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.expand_more_outlined,
                          size: 30, color: MyColors.secondary1)),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        chooseCamera();
                      },
                      icon: const Icon(Icons.add_to_photos_outlined,
                          size: 30, color: MyColors.secondary1)),
                  IconButton(
                      onPressed: () {
                        chooseGallery();
                      },
                      icon: const Icon(Icons.add_a_photo_outlined,
                          size: 30, color: MyColors.secondary1)),
                ],
              ),
            ),
            Form(
              key: formstate,
              child: SizedBox(
                  child: TextFormField(
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
              )),
            ),
          ],
        ));
  }
}

// const snackBar = SnackBar(
//   content: Text('Yay! A SnackBar!'),
// );
