import 'package:bloc/bloc.dart';
import 'package:instagram_clone/core/functions/uploadfile.dart';
import 'package:instagram_clone/data/web_services/follow_web_services.dart';
import 'package:meta/meta.dart';

part 'follow_state.dart';

class FollowCubit extends Cubit<FollowState> {
  final FollowWebServices followWebServices;
  FollowCubit(this.followWebServices) : super(FollowInitial());

  Future followAddTry(String userid, String theyid) async {
    emit(FollowLoading());
    var response = await followWebServices.followAddTry(userid, theyid);
    if (response == RequestResult.success) {
      emit(FollowAddDone());
    } else if (response == RequestResult.failure) {
      emit(FollowAddFailure());
    }
  }

  Future followRemoveTry(String userid, String theyid) async {
    emit(FollowLoading());
    var response = await followWebServices.followRemoveTry(userid, theyid);
    if (response == RequestResult.success) {
      emit(FollowRemoveDone());
    } else if (response == RequestResult.failure) {
      emit(FollowRemoveFailure());
    }
  }
}
