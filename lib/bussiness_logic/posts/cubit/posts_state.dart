part of 'posts_cubit.dart';

@immutable
abstract class PostsState {}

class PostsInitial extends PostsState {}

// final List<Posts> posts = [];

class PostsLoaded extends PostsState {
  final List<Posts> posts;
  PostsLoaded(this.posts);
}
