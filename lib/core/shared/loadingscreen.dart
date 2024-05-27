import 'package:flutter/material.dart';
import 'package:instagram_clone/core/constants/images.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  final double width;
  const LoadingScreen({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(MyLottie.loading, height: width, width: width),
    );
  }
}
