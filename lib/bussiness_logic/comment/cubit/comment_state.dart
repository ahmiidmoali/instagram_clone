part of 'comment_cubit.dart';

@immutable
class CommentState {}

class CommentInitial extends CommentState {}

class CommentLoading extends CommentState {}

class CommentLoaded extends CommentState {
  final List<AllComments> allComments;

  CommentLoaded(this.allComments);
}

class CommentAddLoading extends CommentState {}

class CommentAddDone extends CommentState {}

class CommentAddFailure extends CommentState {}
