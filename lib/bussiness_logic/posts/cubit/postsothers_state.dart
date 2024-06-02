part of 'postsothers_cubit.dart';

abstract class PostsothersState {}

class PostsothersInitial extends PostsothersState {}

// final List<Posts> posts = [];

class PostsothersLoaded extends PostsothersState {
  final List<Posts> posts;
  final List<AllUsers> user;
  final String postscount;
  final String followers;
  final String following;
  final String isFollowed;

  PostsothersLoaded(this.posts, this.user, this.postscount, this.followers,
      this.following, this.isFollowed);
}
