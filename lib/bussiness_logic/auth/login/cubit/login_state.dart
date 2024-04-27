part of 'login_cubit.dart';

@immutable
class LoginState {}

class LoginInitial extends LoginState {
  
}

class LoginLoading extends LoginState {}

class LoginLoaded extends LoginState {
  final List<User> user;
  LoginLoaded(this.user);
}

class LoginFailed extends LoginState {}
