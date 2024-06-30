import 'package:instagram_clone/core/functions/uploadfile.dart';
import 'package:instagram_clone/data/models/allcomments.dart';
import 'package:instagram_clone/data/web_services/comment_web_services.dart';

class CommentRepository {
  final CommentWebServices commentWebServices;
  CommentRepository(this.commentWebServices);

  Future<List<AllComments>> getAllComment(String postid) async {
    final posts = await commentWebServices.getAllComment(postid);

    return posts
        .map((allComments) => AllComments.fromJson(allComments))
        .toList();
  }

  Future<RequestResult> addComment(
      String userid, String content, String postid) async {
    final result = await commentWebServices.addComment(userid, content, postid);

    return result;
  }
}
