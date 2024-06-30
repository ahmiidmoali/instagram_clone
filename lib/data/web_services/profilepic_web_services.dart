import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:instagram_clone/core/constants/links.dart';
import '../../core/functions/uploadfile.dart';

class ProfilePicWebServices {
  Future<RequestResult> addpic(Map data, File? image) async {
    try {
      await addRequestWithImageOne(
        MyLink.profilePicAdd,
        data,
        image,
        "imagename",
      );
      // print(response);
      return RequestResult.success;
    } catch (e) {
      // print("$e error add profile pic");
      return RequestResult.failure;
    }
  }

  Future<RequestResult> deletepic(String userid) async {
    try {
      var response = await http
          .post(Uri.parse(MyLink.profilePicDelete), body: {"id": userid});
      Map responsebody = jsonDecode(response.body);
      if (responsebody["status"] == "success") {
        return RequestResult.success;
      }
      if (responsebody["status"] == "failure") {
        return RequestResult.failure;
      }

      return RequestResult.success;
    } catch (e) {
      // print("$e error delete profile pic");
      return RequestResult.catchfailure;
    }
  }
}
