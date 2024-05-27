import 'package:bloc/bloc.dart';

import '../../../data/models/posts.dart';
import '../../../data/repository/posts_repository.dart';

part 'postsothers_state.dart';

class PostsothersCubit extends Cubit<PostsothersState> {
  final PostsRepository postsRepository;
  List<Posts> posts = [];
  String postscount = "0";
  String followers = "0";
  String following = "0";
  String isFollowed = "0";

  PostsothersCubit(this.postsRepository) : super(PostsothersInitial());

  Future<List> getAllPostsOthers(String id, String mainid) async {
    await postsRepository.getAllPostsothers(id, mainid).then((posts) {
      emit(PostsothersLoaded(posts[4], posts[0], posts[1], posts[2], posts[3]));
      postscount = posts[0];
      followers = posts[1];
      following = posts[2];
      isFollowed = posts[3];
      this.posts = posts[4];
    });
    return posts;
  }
}
