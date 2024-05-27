import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:instagram_clone/core/constants/links.dart';
import 'package:instagram_clone/main.dart';

import '../../core/constants/sharedkeys.dart';
import '../../core/functions/uploadfile.dart';

class ProfilePicWebServices {
  Future<RequestResult> addpic(Map data, File? image) async {
    try {
      var response = await addRequestWithImageOne(
        MyLink.profilePicAdd,
        data,
        image,
        "imagename",
      );
      print(response);
      return RequestResult.success;
    } catch (e) {
      print("$e error");
      return RequestResult.failure;
    }
  }
}
