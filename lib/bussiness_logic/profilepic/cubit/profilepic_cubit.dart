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
}
