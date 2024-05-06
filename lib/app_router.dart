import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/bussiness_logic/auth/login/cubit/login_cubit.dart';
import 'package:instagram_clone/bussiness_logic/mainposts/cubit/mainposts_cubit.dart';
import 'package:instagram_clone/bussiness_logic/posts/cubit/addposts_cubit.dart';
import 'package:instagram_clone/bussiness_logic/posts/cubit/posts_cubit.dart';
import 'package:instagram_clone/bussiness_logic/posts/cubit/postsothers_cubit.dart';
import 'package:instagram_clone/core/constants/routes.dart';
import 'package:instagram_clone/core/constants/sharedkeys.dart';
import 'package:instagram_clone/data/models/profilepage.dart';
import 'package:instagram_clone/data/repository/addposts_repository.dart';
import 'package:instagram_clone/data/repository/login_repository.dart';
import 'package:instagram_clone/data/repository/posts_repository.dart';
import 'package:instagram_clone/data/web_services/addpost_web_services.dart';
import 'package:instagram_clone/data/web_services/login_web_services.dart';
import 'package:instagram_clone/data/web_services/mainposts_web_services.dart';
import 'package:instagram_clone/data/web_services/posts_web_services.dart';
import 'package:instagram_clone/main.dart';
import 'package:instagram_clone/presentation/screens/Authentication/login.dart';
import 'package:instagram_clone/presentation/screens/Authentication/signup.dart';
import 'package:instagram_clone/presentation/screens/homescreen/addPost.dart';
import 'package:instagram_clone/presentation/screens/homescreen/homescreen.dart';

import 'package:instagram_clone/presentation/screens/homescreen/profilepageothers.dart';

import 'data/repository/mainposts_repository.dart';

class AppRouter {
  late PostsothersCubit postsothersCubit;
  late AddPostsCubit addPostsCubit;
  late PostsCubit postsCubit;
  late MainPostsCubit mainPostsCubit;
  late LoginCubit loginCubit;
  AppRouter() {
    postsothersCubit = PostsothersCubit(PostsRepository(PostsWebServices()));
    addPostsCubit = AddPostsCubit(AddPostsRepository(AddPostsWebServices()));
    postsCubit = PostsCubit(PostsRepository(PostsWebServices()));
    mainPostsCubit =
        MainPostsCubit(MainPostsRepository(MainPostsWebServices()));
    loginCubit = LoginCubit(LoginRepository(LoginWebServices()));
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MyRoutes.loginScreen:
        return sharedPreferences.getString(SharedKeys.id) == null
            ? MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => loginCubit,
                  child: const login(),
                ),
              )
            : MaterialPageRoute(
                builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => postsothersCubit,
                    ),
                    BlocProvider(
                      create: (context) => postsCubit,
                    ),
                    BlocProvider(
                      create: (context) => mainPostsCubit,
                    )
                  ],
                  child: homeScreen(
                    userid: sharedPreferences.getString(SharedKeys.id)!,
                  ),
                ),
              );

      case MyRoutes.signupScreen:
        return MaterialPageRoute(
          builder: (context) => const signup(),
        );
      case MyRoutes.homeScreen:
        final userid = settings.arguments as String;
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
            child: homeScreen(
              userid: userid,
            ),
          ),
        );
      case MyRoutes.profileScreen:
        final userid = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: postsothersCubit,
            child: profilePageOthers(
              userid: userid,
            ),
          ),
        );
      case MyRoutes.addPost:
        // final userid = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => addPostsCubit,
            child: addPost(),
          ),
        );
    }
  }
}
