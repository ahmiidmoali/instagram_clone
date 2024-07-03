import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/links.dart';

// String _basicAuth = 'Basic ' + base64Encode(utf8.encode('ahmed:ZBAY9Mup#gbY0'));

// Map<String, String> myheaders = {'authorization': _basicAuth};

class LoginWebServices {
  Future<List> tryLogin(String logintype, String email, String password) async {
    try {
      var response = await http.post(
        Uri.parse(MyLink.login),
        body: {
          "logintype": logintype,
          "email": email,
          "password": password,
        },
        // headers: myheaders
      );
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
