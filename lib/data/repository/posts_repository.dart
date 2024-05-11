import 'package:instagram_clone/data/models/posts.dart';
import 'package:instagram_clone/data/web_services/posts_web_services.dart';

class PostsRepository {
  final PostsWebServices postsWebServices;
  PostsRepository(this.postsWebServices);

  // Future<List<ProfilePage>> getAllPosts(String id) async {
  //   final posts = await postsWebServices.getAllPosts(id);
  //   return posts.map((posts) => ProfilePage.fromJson(posts)).toList();
  // }
  Future<List<Posts>> getAllPosts(String id) async {
    final posts = await postsWebServices.getAllPosts(id);
    // print("the current  posts ${posts}");
    return posts.map((posts) => Posts.fromJson(posts)).toList();
  }

  Future<List> getAllPostsothers(String id) async {
    final posts = await postsWebServices.getAllPostsothers(id);
    // print(posts.length);

    String followers = posts[1].toString();
    String hposts = posts[0].toString();
    String following = posts[2].toString();
    List tposts = posts[3];
    List<Posts> fposts = tposts.map((posts) => Posts.fromJson(posts)).toList();

    return [hposts, followers, following, fposts];
  }
}
