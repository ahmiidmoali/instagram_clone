part of 'profilepic_cubit.dart';

@immutable
abstract class ProfilepicState {}

class ProfilepicInitial extends ProfilepicState {}

class ProfilepicLoading extends ProfilepicState {}

class ProfilepicAddDone extends ProfilepicState {}

class ProfilepicAddFailure extends ProfilepicState {}

class ProfilepicDeleteDone extends ProfilepicState {}

class ProfilepicDeleteFailure extends ProfilepicState {}
