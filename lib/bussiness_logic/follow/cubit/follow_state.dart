part of 'follow_cubit.dart';

@immutable
abstract class FollowState {}

class FollowInitial extends FollowState {}

class FollowLoading extends FollowState {}

class FollowAddDone extends FollowState {}

class FollowRemoveDone extends FollowState {}

class FollowAddFailure extends FollowState {}

class FollowRemoveFailure extends FollowState {}
