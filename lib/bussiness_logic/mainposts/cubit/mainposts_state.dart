part of 'mainposts_cubit.dart';

@immutable
abstract class MainPostsState {}

class MainPostsInitial extends MainPostsState {}

class MainPostsLoading extends MainPostsState {}

class MainPostsLoaded extends MainPostsState {
  final List<MainPosts> mainPosts;
  MainPostsLoaded(this.mainPosts);
}

class MainPostsFailure extends MainPostsState {}
