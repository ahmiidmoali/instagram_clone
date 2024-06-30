import 'package:bloc/bloc.dart';
import 'package:instagram_clone/data/repository/comment_repository.dart';
import 'package:meta/meta.dart';
import '../../../core/functions/uploadfile.dart';
import '../../../data/models/allcomments.dart';
part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  final CommentRepository commentRepository;
  List<AllComments> allComments = [];
  CommentCubit(this.commentRepository) : super(CommentInitial());
  Future<List<AllComments>> getAllComment(String postid) async {
    emit(CommentLoading());
    await commentRepository.getAllComment(postid).then((allComments) {
      this.allComments = allComments;
      emit(CommentLoaded(allComments));
    });

    return allComments;
  }

  Future<RequestResult> addComment(
      String userid, String content, String postid) async {
    emit(CommentAddLoading());
    var result = await commentRepository.addComment(userid, content, postid);
    if (result == RequestResult.success) {
      emit(CommentAddDone());
    }
    if (result == RequestResult.failure ||
        result == RequestResult.catchfailure) {
      emit(CommentAddFailure());
    }

    return result;
  }
}
