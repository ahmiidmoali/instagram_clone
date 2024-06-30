import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:instagram_clone/core/constants/enum.dart';
import 'package:instagram_clone/core/constants/links.dart';

class LikePostWebServices {
  Future<LikeResult> likeTry(String userid, String postid) async {
    try {
      var response = await http.post(Uri.parse(MyLink.likeTry),
          body: {"userid": userid, "postid": postid});
      Map responsebody = jsonDecode(response.body);
      if (responsebody["status"] == "add") {
        return LikeResult.addLike;
      } else if (responsebody["status"] == "remove") {
        return LikeResult.removeLike;
      }

      return LikeResult.failure;
    } catch (e) {
      // print("$e error LikeWebServices");
      return LikeResult.catchfailure;
    }
  }
}
