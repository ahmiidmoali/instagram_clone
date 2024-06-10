import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:instagram_clone/data/models/usermodel.dart';

import '../../core/constants/links.dart';

class LoginWebServices {
  Future<List> tryLogin(String logintype, String email, String password) async {
    try {
      var response = await http.post(Uri.parse(MyLink.login), body: {
        "logintype": logintype,
        "email": email,
        "password": password,
      });
      Map responsebody = jsonDecode(response.body);
      // print(responsebody["data"]);
      List responsebodyList = [];
      responsebodyList.add(responsebody["data"]);
      // print("$responsebodyList");
      return responsebodyList;
    } catch (e) {
      print("error login request $e");
      return [];
    }
  }
}
