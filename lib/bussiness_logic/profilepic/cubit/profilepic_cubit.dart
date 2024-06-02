import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:instagram_clone/core/functions/uploadfile.dart';
import 'package:meta/meta.dart';

import '../../../data/repository/profilepic_repository.dart';

part 'profilepic_state.dart';

class ProfilepicCubit extends Cubit<ProfilepicState> {
  final ProfilePicRepository profilePicRepository;
  ProfilepicCubit(this.profilePicRepository) : super(ProfilepicInitial());

  Future addPic(Map data, File? image) async {
    emit(ProfilepicLoading());
    var result = await profilePicRepository.addPic(data, image);
    if (result == RequestResult.success) {
      emit(ProfilepicAddDone());
    } else if (result == RequestResult.failure) {
      emit(ProfilepicAddFailure());
    }
  }

  Future deletePic(String userid) async {
    emit(ProfilepicLoading());
    var result = await profilePicRepository.deletePic(userid);
    if (result == RequestResult.success) {
      print("successsss");
      emit(ProfilepicDeleteDone());
    } else if (result == RequestResult.failure) {
      emit(ProfilepicDeleteFailure());
    }
  }
}
