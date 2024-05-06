import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:instagram_clone/core/constants/links.dart';
import 'package:instagram_clone/main.dart';

import '../../core/constants/sharedkeys.dart';

class PostsWebServices {
  Future<List> getAllPosts(String id) async {
    try {
      var response =
          await http.post(Uri.parse(MyLink.profileScreen), body: {"id": id});

      Map responsebody = jsonDecode(response.body);
      sharedPreferences.setString(
          SharedKeys.posts, responsebody["posts"].toString());
      sharedPreferences.setString(
          SharedKeys.followers, responsebody["followers"].toString());
      sharedPreferences.setString(
          SharedKeys.following, responsebody["following"].toString());

      print("${responsebody["allposts"]}");
      return responsebody["allposts"];
    } catch (e) {
      print("$e error");
      return [];
    }
  }

  Future<List> getAllPostsothers(String id) async {
    try {
      var response =
          await http.post(Uri.parse(MyLink.profileScreen), body: {"id": id});

      Map responsebody = jsonDecode(response.body);

      print("here we go ${responsebody}");
      return [
        responsebody["posts"],
        responsebody["followers"],
        responsebody["following"],
        responsebody["allposts"]
      ];
    } catch (e) {
      print("$e error");
      return [0, 0, 0, []];
    }
  }
}
