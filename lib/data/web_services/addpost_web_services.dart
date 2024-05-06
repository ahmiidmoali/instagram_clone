import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:instagram_clone/core/constants/links.dart';
import 'package:instagram_clone/main.dart';

import '../../core/constants/sharedkeys.dart';
import '../../core/functions/uploadfile.dart';

class AddPostsWebServices {
  Future<requestResult> addPosts(Map data, File? image) async {
    try {
      var response = await addRequestWithImageOne(
        MyLink.addPost,
        data,
        image,
        "imagename",
      );
      print(response);
      return response;
    } catch (e) {
      print("$e error");
      return requestResult.catchfailure;
    }
  }
}
