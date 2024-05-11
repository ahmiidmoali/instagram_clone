import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:instagram_clone/core/constants/links.dart';

class MainPostsWebServices {
  Future<List> getAllmainPosts(String userid) async {
    try {
      var response =
          await http.post(Uri.parse(MyLink.mainScreen), body: {"id": userid});

      Map responsebody = jsonDecode(response.body);

      // print("${responsebody["data"]}");
      return responsebody["data"];
    } catch (e) {
      print("$e error dsdddddddddddddddddddddddddddddddddddd");
      return [];
    }
  }
}
