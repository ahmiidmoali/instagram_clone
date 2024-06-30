import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/bussiness_logic/auth/login/cubit/login_cubit.dart';
import 'package:instagram_clone/bussiness_logic/auth/signup/cubit/signup_cubit.dart';
import 'package:instagram_clone/bussiness_logic/follow/cubit/follow_cubit.dart';
import 'package:instagram_clone/bussiness_logic/likepost/cubit/like_post_cubit.dart';
import 'package:instagram_clone/bussiness_logic/mainposts/cubit/mainposts_cubit.dart';
import 'package:instagram_clone/bussiness_logic/posts/cubit/addposts_cubit.dart';
import 'package:instagram_clone/bussiness_logic/posts/cubit/posts_cubit.dart';
import 'package:instagram_clone/bussiness_logic/posts/cubit/postsothers_cubit.dart';
import 'package:instagram_clone/bussiness_logic/profilepic/cubit/profilepic_cubit.dart';
import 'package:instagram_clone/core/constants/routes.dart';
import 'package:instagram_clone/core/constants/sharedkeys.dart';
import 'package:instagram_clone/data/repository/addposts_repository.dart';
import 'package:instagram_clone/data/repository/comment_repository.dart';
import 'package:instagram_clone/data/repository/login_repository.dart';
import 'package:instagram_clone/data/repository/posts_repository.dart';
import 'package:instagram_clone/data/repository/profilepic_repository.dart';
import 'package:instagram_clone/data/repository/searchpage_repository.dart';
import 'package:instagram_clone/data/repository/signup_repository.dart';
import 'package:instagram_clone/data/web_services/addpost_web_services.dart';
import 'package:instagram_clone/data/web_services/comment_web_services.dart';
import 'package:instagram_clone/data/web_services/follow_web_services.dart';
import 'package:instagram_clone/data/web_services/login_web_services.dart';
import 'package:instagram_clone/data/web_services/mainposts_web_services.dart';
import 'package:instagram_clone/data/web_services/posts_web_services.dart';
import 'package:instagram_clone/data/web_services/profilepic_web_services.dart';
import 'package:instagram_clone/data/web_services/search_web_services.dart';
import 'package:instagram_clone/data/web_services/signup_web_services.dart';
import 'package:instagram_clone/main.dart';
import 'package:instagram_clone/presentation/screens/Authentication/login.dart';
import 'package:instagram_clone/presentation/screens/Authentication/signup.dart';
import 'package:instagram_clone/presentation/screens/homescreen/addPost.dart';
import 'package:instagram_clone/presentation/screens/homescreen/addpic.dart';
import 'package:instagram_clone/presentation/screens/homescreen/homescreen.dart';
import 'package:instagram_clone/presentation/screens/homescreen/profilepageothers.dart';
import 'bussiness_logic/comment/cubit/comment_cubit.dart';
import 'bussiness_logic/searchpage/cubit/searchpage_cubit.dart';
import 'data/models/allusers.dart';
import 'data/repository/mainposts_repository.dart';
import 'data/web_services/like_web_services.dart';

class AppRouter {
  late PostsothersCubit postsothersCubit;
  late FollowCubit followCubit;
  late LikePostCubit likePostCubit;
  late CommentCubit commentCubit;
  late AddPostsCubit addPostsCubit;
  late SearchpageCubit searchpageCubit;
  late PostsCubit postsCubit;
  late ProfilepicCubit profilepicCubit;
  late MainPostsCubit mainPostsCubit;
  //-Auth
  late LoginCubit loginCubit;
  late SignupCubit signupCubit;
  AppRouter() {
    postsothersCubit = PostsothersCubit(PostsRepository(PostsWebServices()));
    followCubit = FollowCubit(FollowWebServices());
    likePostCubit = LikePostCubit(LikePostWebServices());
    commentCubit = CommentCubit(CommentRepository(CommentWebServices()));
    addPostsCubit = AddPostsCubit(AddPostsRepository(AddPostsWebServices()));
    searchpageCubit =
        SearchpageCubit(SearchPageRepository(SearchWebServices()));
    postsCubit = PostsCubit(PostsRepository(PostsWebServices()));
    profilepicCubit =
        ProfilepicCubit(ProfilePicRepository(ProfilePicWebServices()));
    mainPostsCubit =
        MainPostsCubit(MainPostsRepository(MainPostsWebServices()));
    //-Auth
    loginCubit = LoginCubit(LoginRepository(LoginWebServices()));
    signupCubit = SignupCubit(SignUpRepository(SignUpWebServices()));
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MyRoutes.loginScreen:
        return sharedPreferences.getString(SharedKeys.id) == null
            ? MaterialPageRoute(
                builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => loginCubit,
                    ),
                    BlocProvider(
                      create: (context) => signupCubit,
                    )
                  ],
                  child: const Login(),
                ),
              )
            : MaterialPageRoute(
                builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => postsothersCubit,
                    ),
                    BlocProvider(
                      create: (context) => profilepicCubit,
                    ),
                    BlocProvider(
                      create: (context) => followCubit,
                    ),
                    BlocProvider(
                      create: (context) => likePostCubit,
                    ),
                    BlocProvider(
                      create: (context) => commentCubit,
                    ),
                    BlocProvider(
                      create: (context) => addPostsCubit,
                    ),
                    BlocProvider(
                      create: (context) => searchpageCubit,
                    ),
                    BlocProvider(
                      create: (context) => postsCubit,
                    ),
                    BlocProvider(
                      create: (context) => mainPostsCubit,
                    )
                  ],
                  child: HomeScreen(
                    userid: sharedPreferences.getString(SharedKeys.id) ?? "0",
                  ),
                ),
              );

      case MyRoutes.signupScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: signupCubit,
                  child: const Signup(),
                ));

      case MyRoutes.homeScreen:
        final userdata = settings.arguments as AllUsers;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => postsothersCubit,
              ),
              BlocProvider(
                create: (context) => profilepicCubit,
              ),
              BlocProvider(
                create: (context) => likePostCubit,
              ),
              BlocProvider(
                create: (context) => commentCubit,
              ),
              BlocProvider(
                create: (context) => addPostsCubit,
              ),
              BlocProvider(
                create: (context) => searchpageCubit,
              ),
              BlocProvider(
                create: (context) => postsCubit,
              ),
              BlocProvider(
                create: (context) => mainPostsCubit,
              )
            ],
            child: HomeScreen(
              userid: userdata.usersId.toString(),
            ),
          ),
        );

      case MyRoutes.otherprofileScreen:
        final userid = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: postsothersCubit,
              ),
              BlocProvider.value(
                value: followCubit,
              )
            ],
            child: ProfilePageOthers(
              usersId: userid,
            ),
          ),
        );

      case MyRoutes.addPost:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: addPostsCubit,
                    ),
                    BlocProvider.value(
                      value: postsCubit,
                    )
                  ],
                  child: const AddPost(),
                ));

      case MyRoutes.profilePic:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: profilepicCubit,
                    ),
                    BlocProvider.value(
                      value: postsCubit,
                    )
                  ],
                  child: const AddPic(),
                ));
    }
    return null;
  }
}
