import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:instagram_clone/core/constants/links.dart';
import 'package:instagram_clone/main.dart';

import '../../core/constants/sharedkeys.dart';

class SearchWebServices {
  Future<List> getAllPosts(String id) async {
    try {
      var response =
          await http.post(Uri.parse(MyLink.searchPage), body: {"id": id});
      Map responsebody = jsonDecode(response.body);

      return [responsebody["allusers"], responsebody["allPosts"]];
    } catch (e) {
      print("$e error");
      return [];
    }
  }
}
