import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:instagram_clone/core/constants/links.dart';
import 'package:instagram_clone/core/functions/uploadfile.dart';

class CommentWebServices {
  Future<RequestResult> addComment(
      String userid, String content, String postid) async {
    try {
      var response = await http.post(Uri.parse(MyLink.commentAdd),
          body: {"userid": userid, "postid": postid, "content": content});

      Map responsebody = jsonDecode(response.body);

      if (responsebody["status"] == "success") {
        return RequestResult.success;
      } else if (responsebody["status"] == "failure") {
        return RequestResult.failure;
      }
      return RequestResult.failure;
    } catch (e) {
      print("$e error addComment CommentWebServices");
      return RequestResult.catchfailure;
    }
  }

  Future<List> getAllComment(String postid) async {
    try {
      var response = await http.post(Uri.parse(MyLink.commentView), body: {
        "postid": postid,
      });

      Map responsebody = jsonDecode(response.body);

      return responsebody["data"];
    } catch (e) {
      print("$e error getAllComment CommentWebServices");
      return [];
    }
  }
}
