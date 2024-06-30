import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:instagram_clone/core/constants/links.dart';
import 'package:instagram_clone/core/functions/uploadfile.dart';

class SignUpWebServices {
  Future<RequestResult> trySignUp(
      String username, String fullname, String email, String password) async {
    try {
      var response = await http.post(Uri.parse(MyLink.signup), body: {
        "username": username,
        "userfullname": fullname,
        "email": email,
        "password": password
      });

      Map responsebody = jsonDecode(response.body);

      if (responsebody["status"] == "success") {
        return RequestResult.success;
      } else if (responsebody["status"] == "failure") {
        return RequestResult.failure;
      }
      return RequestResult.failure;
    } catch (e) {
      // print("$e error trySignUp SignUpWebServices");
      return RequestResult.catchfailure;
    }
  }
}
