part of 'searchpage_cubit.dart';

@immutable
abstract class SearchpageState {}

class SearchpageInitial extends SearchpageState {}

class SearchpageLoading extends SearchpageState {}

class SearchpageLoaded extends SearchpageState {
  final List<MainPosts> allposts;
  final List<AllUsers> allUsers;
  SearchpageLoaded(this.allUsers, this.allposts);
}

class SearchpageFailure extends SearchpageState {}

class SearchpageIsSearching extends SearchpageState {
  final List<AllUsers> allUsersSearched;
  SearchpageIsSearching(this.allUsersSearched);
}
