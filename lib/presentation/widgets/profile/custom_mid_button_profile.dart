import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/colors.dart';

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
