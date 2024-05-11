import 'package:flutter/material.dart';
import 'package:instagram_clone/core/constants/images.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(MyLottie.loading, height: 50, width: 50),
    );
  }
}
