import 'package:instagram_clone/data/models/posts.dart';
import 'package:instagram_clone/data/web_services/posts_web_services.dart';

class PostsRepository {
  final PostsWebServices postsWebServices;
  PostsRepository(this.postsWebServices);

  Future<List<Posts>> getAllPosts(String id) async {
    final posts = await postsWebServices.getAllPosts(id);
    return posts.map((posts) => Posts.fromJson(posts)).toList();
    // return posts.map((posts) => Posts.fromJson(posts)).toList();
  }
}
