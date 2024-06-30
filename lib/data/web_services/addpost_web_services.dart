import 'dart:io';
import 'package:instagram_clone/core/constants/links.dart';
import 'package:instagram_clone/main.dart';
import '../../core/constants/sharedkeys.dart';
import '../../core/functions/uploadfile.dart';

class AddPostsWebServices {
  Future<RequestResult> addPosts(Map data, File? image) async {
    try {
      var response = await addRequestWithImageOne(
        MyLink.addPost,
        data,
        image,
        "imagename",
      );
      // print(response);
      return RequestResult.success;
    } catch (e) {
      // print("$e error AddPostsWebServices");
      return RequestResult.catchfailure;
    }
  }
}
