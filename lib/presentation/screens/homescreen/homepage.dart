import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/bussiness_logic/mainposts/cubit/mainposts_cubit.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/constants/images.dart';
import 'package:instagram_clone/data/models/mainposts.dart';

import '../../widgets/homepage/custom_post_homepage_widget.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    late List<MainPosts> allMainPosts;
    return ListView(
      children: [
        const SizedBox(
          height: 30,
        ),
        //------------add &view stories--------------------
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: MyColors.secondary2),
                    child: Image.asset(
                      Myimages.profile,
                      height: 100,
                      width: 100,
                      fit: BoxFit.fill,
                    )),
                const Text(
                  "your story",
                  style: TextStyle(fontSize: 20, color: MyColors.secondary1),
                ),
              ],
            ),
            const Spacer()
          ],
        ),
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
              return const Center(
                child: Text(
                  "loading .............",
                  style: TextStyle(color: MyColors.secondary1),
                ),
              );
            }
          },
        )
      ],
    );
  }
}
