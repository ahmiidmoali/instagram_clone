import 'package:instagram_clone/data/models/mainposts.dart';
import '../web_services/mainposts_web_services.dart';

class MainPostsRepository {
  final MainPostsWebServices mainPostsWebServices;
  MainPostsRepository(this.mainPostsWebServices);

  Future<List<MainPosts>> getAllMainPosts(String id) async {
    final posts = await mainPostsWebServices.getAllmainPosts(id);

    return posts.map((posts) => MainPosts.fromJson(posts)).toList();
  }
}
