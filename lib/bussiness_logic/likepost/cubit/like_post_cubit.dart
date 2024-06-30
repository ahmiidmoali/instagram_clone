import 'package:bloc/bloc.dart';
import 'package:instagram_clone/core/constants/enum.dart';
import 'package:instagram_clone/data/web_services/like_web_services.dart';
import 'package:meta/meta.dart';

part 'like_post_state.dart';

class LikePostCubit extends Cubit<LikePostState> {
  final LikePostWebServices likePostWebServices;
  LikePostCubit(this.likePostWebServices) : super(LikePostInitial());
  Future likePostTry(String userid, String postid) async {
    emit(LikePostLoading());
    var response = await likePostWebServices.likeTry(userid, postid);
    if (response == LikeResult.addLike) {
      emit(LikePostAddDone());
    } else if (response == LikeResult.removeLike) {
      emit(LikePostRemoveDone());
    } else if (response == LikeResult.failure) {
      emit(LikePostFailure());
    }
  }
}
