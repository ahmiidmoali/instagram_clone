import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:instagram_clone/data/models/usermodel.dart';

import '../../constants/links.dart';

class LoginWebServices {
  Future<List> tryLogin(String logintype, String email, String password) async {
    try {
      var response = await http.post(Uri.parse(MyLink.login), body: {
        "logintype": logintype,
        "email": email,
        "password": password,
      });
      Map responsebody = jsonDecode(response.body);
      print(responsebody);
      return responsebody[0];
    } catch (e) {
      print("login request $e");
      return [];
    }
  }
}
