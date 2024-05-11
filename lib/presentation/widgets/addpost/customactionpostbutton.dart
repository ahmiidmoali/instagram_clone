import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../bussiness_logic/posts/cubit/addposts_cubit.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/images.dart';

class CustomActionPostButton extends StatelessWidget {
  final Function()? onTap;
  const CustomActionPostButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPostsCubit, AddPostsState>(
      builder: (context, state) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocConsumer<AddPostsCubit, AddPostsState>(
              listener: (context, state) {
                if (state is AddPostsDone) {
                  Navigator.of(context).pop();
                }
                if (state is AddPostsFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      "Posting Failed please try again",
                      style:
                          TextStyle(fontSize: 20, color: MyColors.secondary1),
                    ),
                  ));
                }
              },
              builder: (context, state) {
                if (state is AddPostsLoading) {
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
      },
    );
  }
}
