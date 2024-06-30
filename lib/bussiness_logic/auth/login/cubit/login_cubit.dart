import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:instagram_clone/core/constants/sharedkeys.dart';
import 'package:instagram_clone/data/models/allusers.dart';
import 'package:instagram_clone/data/repository/login_repository.dart';
import 'package:instagram_clone/main.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;

  LoginCubit(this.loginRepository) : super(LoginInitial());

  List<AllUsers> user = [];

  Future<List<AllUsers>> tryLogin(
      String logintype, String email, String password) async {
    emit(LoginLoading());
    try {
      await loginRepository.tryLogin(logintype, email, password).then((user) {
        this.user = user;
        sharedPreferences.setString(SharedKeys.id, user[0].usersId.toString());

        emit(LoginLoaded(user));
      });
    } on SocketException catch (_) {
      user = [];
      emit(LoginFailed());
    } catch (_) {
      user = [];
      emit(LoginFailed());
    }
    return user;
  }
}
