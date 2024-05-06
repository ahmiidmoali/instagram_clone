part of 'addposts_cubit.dart';

abstract class AddPostsState {}

class AddPostsInitial extends AddPostsState {}

class AddPostsLoading extends AddPostsState {}

class AddPostsDone extends AddPostsState {}

class AddPostsFailure extends AddPostsState {}
