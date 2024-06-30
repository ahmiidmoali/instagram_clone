import 'package:instagram_clone/data/models/allusers.dart';
import 'package:instagram_clone/data/web_services/search_web_services.dart';
import '../models/mainposts.dart';

class SearchPageRepository {
  final SearchWebServices searchWebServices;
  SearchPageRepository(this.searchWebServices);

  Future<List> getAllData(String id) async {
    final response = await searchWebServices.getAllPosts(id);
    // print(response);
    List users = response[0];
    List posts = response[1];
    List<AllUsers> allUsers =
        users.map((allUsers) => AllUsers.fromJson(allUsers)).toList();
    List<MainPosts> allPosts =
        posts.map((allPosts) => MainPosts.fromJson(allPosts)).toList();
    return [allUsers, allPosts];
  }
}
