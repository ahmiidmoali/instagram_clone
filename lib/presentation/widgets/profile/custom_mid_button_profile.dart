import 'package:flutter/material.dart';
import 'package:instagram_clone/core/constants/colors.dart';

class customMidButtonProfile extends StatelessWidget {
  final String data;

  const customMidButtonProfile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width / 2.7,
      height: 30,
      decoration: BoxDecoration(
          color: MyColors.secondary2,
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: MaterialButton(
        onPressed: () {},
        child: Text(
          data,
          style: const TextStyle(fontSize: 18, color: MyColors.secondary1),
        ),
      ),
    );
  }
}

class customFollowButtonProfile extends StatelessWidget {
  final String data;
  final String data2;
  final String isFollowed;
  final Function()? onPressed;

  const customFollowButtonProfile(
      {super.key,
      required this.data,
      required this.isFollowed,
      required this.onPressed,
      required this.data2});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width / 2.7,
      height: 30,
      decoration: BoxDecoration(
          color: isFollowed == "0" ? MyColors.secondary3 : MyColors.secondary2,
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          isFollowed == "0" ? data : data2,
          style: const TextStyle(fontSize: 18, color: MyColors.secondary1),
        ),
      ),
    );
  }
}
