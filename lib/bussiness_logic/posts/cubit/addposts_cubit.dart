import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:instagram_clone/core/functions/uploadfile.dart';
import '../../../data/repository/addposts_repository.dart';
part 'addposts_state.dart';

class AddPostsCubit extends Cubit<AddPostsState> {
  final AddPostsRepository addPostsRepository;

  AddPostsCubit(this.addPostsRepository) : super(AddPostsInitial());

  addPost(Map data, File? image) async {
    emit(AddPostsLoading());
    var result = await addPostsRepository.addPost(data, image);
    if (result == requestResult.success) {
      emit(AddPostsDone());
    } else if (result == requestResult.failure ||
        result == requestResult.catchfailure) {
      emit(AddPostsFailure());
    }
  }
}
