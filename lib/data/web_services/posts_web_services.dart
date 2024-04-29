import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:instagram_clone/core/constants/links.dart';

class PostsWebServices {
  Future<List> getAllPosts(String id) async {
    try {
      var response =
          await http.post(Uri.parse(MyLink.profileScreen), body: {"id": id});

      Map responsebody = jsonDecode(response.body);

      print("${responsebody["data"]}");
      return responsebody["data"];
    } catch (e) {
      print("$e error");
      return [];
    }
  }
}


// class PostsWebServices {
//   late Dio dio;
//   PostsWebServices() {
//     BaseOptions baseOptions = BaseOptions(
//         baseUrl: 'http://10.0.2.2:8012/instagramclonebend/',
//         receiveDataWhenStatusError: true,
//         connectTimeout: Duration(seconds: 20),
//         receiveTimeout: Duration(seconds: 20));
//     dio = Dio(baseOptions);
//   }
//   Future<Map> getAllPosts() async {
//     try {
//       Response response =
//           await dio.post('home.php', queryParameters: {"id": "1"});

//       // print("${response.data[1]}");
//       print("okokokokko");
//       Map responsebody = jsonDecode(response.data);
//       return responsebody;
//     } catch (e) {
//       print(e);
//       print("not ok");
//       return {};
//     }
//   }
// }
