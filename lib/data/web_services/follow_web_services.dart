import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:instagram_clone/core/constants/links.dart';
import 'package:instagram_clone/core/functions/uploadfile.dart';

class FollowWebServices {
  Future<RequestResult> followAddTry(String userid, String theyid) async {
    try {
      await http.post(Uri.parse(MyLink.followAdd),
          body: {"userid": userid, "theyid": theyid});

      return RequestResult.success;
    } catch (e) {
      // print("$e error followAddTry");
      return RequestResult.failure;
    }
  }

  Future<RequestResult> followRemoveTry(String userid, String theyid) async {
    try {
      await http.post(Uri.parse(MyLink.followRemove),
          body: {"userid": userid, "theyid": theyid});

      return RequestResult.success;
    } catch (e) {
      // print("$e error followRemoveTry");
      return RequestResult.failure;
    }
  }
}
