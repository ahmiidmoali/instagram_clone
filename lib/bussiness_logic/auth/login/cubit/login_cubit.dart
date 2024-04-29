import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/core/constants/routes.dart';
import 'package:instagram_clone/core/constants/sharedkeys.dart';
import 'package:instagram_clone/data/repository/login_repository.dart';
import 'package:instagram_clone/main.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/usermodel.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository loginRepository;

  List<User> user = [];

  LoginCubit(this.loginRepository) : super(LoginInitial());
  Future<List<User>> tryLogin(
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
