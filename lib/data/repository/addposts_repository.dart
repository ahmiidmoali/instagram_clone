import 'dart:io';
import '../../core/functions/uploadfile.dart';
import '../web_services/addpost_web_services.dart';

class AddPostsRepository {
  final AddPostsWebServices addpostsWebServices;
  AddPostsRepository(this.addpostsWebServices);

  Future<RequestResult> addPost(Map data, File? image) async {
    final result = await addpostsWebServices.addPosts(data, image);
    return result;
  }
}
