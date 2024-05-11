import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/bussiness_logic/mainposts/cubit/mainposts_cubit.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/shared/loadingscreen.dart';
import 'package:instagram_clone/data/models/mainposts.dart';
import '../../widgets/homepage/custom_post_homepage_widget.dart';
import '../../widgets/homepage/customstorygenerator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    late List<MainPosts> allMainPosts;
    return ListView(
      children: [
        const SizedBox(
          height: 30,
        ),
        //------------add &view stories--------------------
        const CustomStoryGenerator(),
        const SizedBox(
          height: 20,
        ),

        //------------------all generated pics & vedios & tags-------------------
        BlocBuilder<MainPostsCubit, MainPostsState>(
          builder: (context, state) {
            if (state is MainPostsLoaded) {
              allMainPosts = state.mainPosts;

              return CustomPostHomePageWidget(mainPosts: allMainPosts);
            } else {
              return const LoadingScreen();
            }
          },
        )
      ],
    );
  }
}
