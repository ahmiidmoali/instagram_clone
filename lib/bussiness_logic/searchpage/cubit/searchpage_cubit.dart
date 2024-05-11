import 'package:bloc/bloc.dart';
import 'package:instagram_clone/data/models/allusers.dart';
import 'package:instagram_clone/data/models/posts.dart';
import 'package:meta/meta.dart';

import '../../../data/models/mainposts.dart';
import '../../../data/repository/searchpage_repository.dart';

part 'searchpage_state.dart';

class SearchpageCubit extends Cubit<SearchpageState> {
  final SearchPageRepository searchPageRepository;
  List<AllUsers> allUsers = [];
  List<AllUsers> allUsersSearched = [];
  List<MainPosts> allPosts = [];
  SearchpageCubit(this.searchPageRepository) : super(SearchpageInitial());

  Future<List> getAllPosts(String id) async {
    emit(SearchpageLoading());

    List allData = await searchPageRepository.getAllData(id);
    if (allData.isNotEmpty) {
      allUsers = allData[0];
      allPosts = allData[1];
      emit(SearchpageLoaded(allUsers, allPosts));
      return [];
    }
    if (allPosts.isEmpty) {
      allUsers = [];
      allPosts = [];

      emit(SearchpageFailure());
      return [];
    }
    return [];
  }

  isSearching(String value) {
    if (value.isNotEmpty) {
      allUsersSearched = allUsers
          .where((user) => user.usersName!.toLowerCase().startsWith(value))
          .toList();
      emit(SearchpageIsSearching(allUsersSearched));
    }
    if (value.isEmpty) {
      allUsersSearched.clear();
      emit(SearchpageLoaded(allUsers, allPosts));
    }
  }
}
