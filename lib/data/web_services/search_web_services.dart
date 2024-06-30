import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:instagram_clone/core/constants/links.dart';

class SearchWebServices {
  Future<List> getAllPosts(String id) async {
    try {
      var response =
          await http.post(Uri.parse(MyLink.searchPage), body: {"id": id});
      Map responsebody = jsonDecode(response.body);
      List allposts = responsebody["allPosts"] ?? [];

      return [responsebody["allusers"], allposts];
    } catch (e) {
      // print("$e error SearchWebServices");
      return [];
    }
  }
}
