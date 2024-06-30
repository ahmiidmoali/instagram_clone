import 'dart:io';
import '../../core/functions/uploadfile.dart';
import '../web_services/profilepic_web_services.dart';

class ProfilePicRepository {
  final ProfilePicWebServices profilePicWebServices;
  ProfilePicRepository(this.profilePicWebServices);

  Future<RequestResult> addPic(Map data, File? image) async {
    final result = await profilePicWebServices.addpic(data, image);
    return result;
  }

  Future<RequestResult> deletePic(String userid) async {
    final result = await profilePicWebServices.deletepic(userid);
    return result;
  }
}
