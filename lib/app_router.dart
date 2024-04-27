import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/bussiness_logic/auth/login/cubit/login_cubit.dart';
import 'package:instagram_clone/bussiness_logic/mainposts/cubit/mainposts_cubit.dart';
import 'package:instagram_clone/bussiness_logic/posts/cubit/posts_cubit.dart';
import 'package:instagram_clone/constants/routes.dart';
import 'package:instagram_clone/data/repository/login_repository.dart';
import 'package:instagram_clone/data/repository/posts_repository.dart';
import 'package:instagram_clone/data/web_services/login_web_services.dart';
import 'package:instagram_clone/data/web_services/mainposts_web_services.dart';
import 'package:instagram_clone/data/web_services/posts_web_services.dart';
import 'package:instagram_clone/presentation/screens/Authentication/login.dart';
import 'package:instagram_clone/presentation/screens/Authentication/signup.dart';
import 'package:instagram_clone/presentation/screens/homescreen/homescreen.dart';
import 'package:instagram_clone/presentation/screens/homescreen/profilepage.dart';

import 'data/repository/mainposts_repository.dart';

class AppRouter {
  late PostsCubit postsCubit;
  late MainPostsCubit mainPostsCubit;
  late LoginCubit loginCubit;
  AppRouter() {
    postsCubit = PostsCubit(PostsRepository(PostsWebServices()));
    mainPostsCubit =
        MainPostsCubit(MainPostsRepository(MainPostsWebServices()));
    loginCubit = LoginCubit(LoginRepository(LoginWebServices()));
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MyRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => loginCubit,
            child: const login(),
          ),
        );

      case MyRoutes.signupScreen:
        return MaterialPageRoute(
          builder: (context) => const signup(),
        );
      case MyRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => postsCubit,
              ),
              BlocProvider(
                create: (context) => mainPostsCubit,
              )
            ],
            child: const homeScreen(),
          ),
        );
    }
  }
}
