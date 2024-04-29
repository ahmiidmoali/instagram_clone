import 'package:bloc/bloc.dart';
import 'package:instagram_clone/data/repository/posts_repository.dart';
import 'package:meta/meta.dart';

import '../../../data/models/posts.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final PostsRepository postsRepository;
  List<Posts> posts = [];
  PostsCubit(this.postsRepository) : super(PostsInitial());
  Future<List<Posts>> getAllPosts(String id) async {
    await postsRepository.getAllPosts(id).then((posts) {
      emit(PostsLoaded(posts));
      this.posts = posts;
    });
    return posts;
  }
}
