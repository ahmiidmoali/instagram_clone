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

  PostsothersCubit(this.postsRepository) : super(PostsothersInitial());

  Future<List> getAllPostsOthers(String id) async {
    await postsRepository.getAllPostsothers(id).then((posts) {
      emit(PostsothersLoaded(posts[3], posts[0], posts[1], posts[2]));
      postscount = posts[0];
      followers = posts[1];
      following = posts[2];
      this.posts = posts[3];
    });
    return posts;
  }
}
