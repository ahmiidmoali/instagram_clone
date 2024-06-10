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

      //------- restore count(posts_followers-following)-----------------
      sharedPreferences.setString(
          SharedKeys.posts, responsebody["posts"].toString());
      sharedPreferences.setString(
          SharedKeys.followers, responsebody["followers"].toString());
      sharedPreferences.setString(
          SharedKeys.following, responsebody["following"].toString());
      sharedPreferences.setString(
          SharedKeys.myPic, responsebody["usersData"][0]["users_profilepic"]);
      sharedPreferences.setString(
          SharedKeys.myusername, responsebody["usersData"][0]["users_name"]);
//---------------------------------
      // print(" allposts ${responsebody["allposts"]}");

      return responsebody["allposts"];
    } catch (e) {
      print("$e error PostsWebServices ");
      return [];
    }
  }

  Future<List> getAllPostsothers(String id, String mainid) async {
    try {
      var response = await http.post(Uri.parse(MyLink.profileScreenother),
          body: {"id": id, "mainid": mainid});

      Map responsebody = jsonDecode(response.body);

      // print("here we go ${responsebody}");
      return [
        responsebody["posts"],
        responsebody["followers"],
        responsebody["following"],
        responsebody["isFollowed"],
        responsebody["allposts"],
        responsebody["usersData"]
      ];
    } catch (e) {
      print("$e error");
      return [0, 0, 0, 0, [], []];
    }
  }
}
