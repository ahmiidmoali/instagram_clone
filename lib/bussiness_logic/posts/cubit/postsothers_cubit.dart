import 'package:bloc/bloc.dart';
import 'package:instagram_clone/data/models/allusers.dart';

import '../../../data/models/posts.dart';
import '../../../data/repository/posts_repository.dart';

part 'postsothers_state.dart';

class PostsothersCubit extends Cubit<PostsothersState> {
  final PostsRepository postsRepository;
  List<Posts> posts = [];
  List<AllUsers> user = [];
  String postscount = "0";
  String followers = "0";
  String following = "0";
  String isFollowed = "0";

  PostsothersCubit(this.postsRepository) : super(PostsothersInitial());

  Future<List> getAllPostsOthers(String id, String mainid) async {
    await postsRepository.getAllPostsothers(id, mainid).then((data) {
      postscount = data[0];
      followers = data[1];
      following = data[2];
      isFollowed = data[3];
      posts = data[4];
      user = data[5];
      emit(PostsothersLoaded(
          data[4], data[5], data[0], data[1], data[2], data[3]));
    });
    return posts;
  }
}
