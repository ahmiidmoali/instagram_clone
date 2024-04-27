import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/mainposts.dart';
import '../../../data/repository/mainposts_repository.dart';

part 'mainposts_state.dart';

class MainPostsCubit extends Cubit<MainPostsState> {
  final MainPostsRepository mainPostsRepository;
  List<MainPosts> mainPosts = [];
  MainPostsCubit(this.mainPostsRepository) : super(MainPostsInitial());
  Future<List<MainPosts>> getAllMainPosts(String id) async {
    // id = id;
    emit(MainPostsLoading());
    await mainPostsRepository.getAllMainPosts(id).then((mainPosts) {
      emit(MainPostsLoaded(mainPosts));
      this.mainPosts = mainPosts;
    });
    print(mainPosts);
    return mainPosts;
  }
}
