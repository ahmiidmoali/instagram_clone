import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/bussiness_logic/profilepic/cubit/profilepic_cubit.dart';
import 'package:lottie/lottie.dart';

import '../../../bussiness_logic/posts/cubit/addposts_cubit.dart';
import '../../../bussiness_logic/posts/cubit/posts_cubit.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/images.dart';

class CustomActionProfilePicButton extends StatelessWidget {
  final String userid;
  final Function()? onTap;
  const CustomActionProfilePicButton(
      {super.key, required this.onTap, required this.userid});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<ProfilepicCubit, ProfilepicState>(
          listener: (context, state) {
            if (state is ProfilepicAddDone) {
              BlocProvider.of<PostsCubit>(context).getAllPosts(userid);
              Navigator.of(context).pop();
            }
            if (state is ProfilepicAddFailure) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text(
                  "Posting Failed please try again",
                  style: TextStyle(fontSize: 20, color: MyColors.secondary1),
                ),
              ));
            }
          },
          builder: (context, state) {
            if (state is ProfilepicLoading) {
              return Lottie.asset(MyLottie.loading, height: 35, width: 35);
            }
            return InkWell(
              onTap: onTap,
              child: const Text(
                "Post",
                style: TextStyle(fontSize: 20, color: MyColors.secondary3),
              ),
            );
          },
        ),
      ),
    );
  }
}
