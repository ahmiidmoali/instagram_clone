part of 'like_post_cubit.dart';

@immutable
class LikePostState {}

class LikePostInitial extends LikePostState {}

class LikePostLoading extends LikePostState {}

class LikePostAddDone extends LikePostState {}

class LikePostRemoveDone extends LikePostState {}

class LikePostFailure extends LikePostState {}

class LikePostCatchFailure extends LikePostState {}
