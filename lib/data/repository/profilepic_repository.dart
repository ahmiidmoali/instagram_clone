import 'dart:io';
import 'package:instagram_clone/presentation/screens/homescreen/addPost.dart';

import '../../core/functions/uploadfile.dart';
import '../web_services/addpost_web_services.dart';
import '../web_services/profilepic_web_services.dart';

class ProfilePicRepository {
  final ProfilePicWebServices profilePicWebServices;
  ProfilePicRepository(this.profilePicWebServices);

  Future<RequestResult> addPic(Map data, File? image) async {
    final result = await profilePicWebServices.addpic(data, image);
    return result;
  }
}
