import 'package:flutter/material.dart';
import 'package:instagram_clone/core/constants/colors.dart';

class customBottomNavigationBarHomeScreen extends StatelessWidget {
  final void Function()? index0;
  final void Function()? index1;
  final void Function()? index2;
  final void Function()? index3;
  final void Function()? bottomButtom;
  const customBottomNavigationBarHomeScreen(
      {super.key,
      required this.index0,
      required this.index1,
      required this.index2,
      required this.index3,
      required this.bottomButtom});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: MyColors.background,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5))),
      child: Row(
        children: [
          Expanded(
              child: IconButton(
                  onPressed: index0,
                  icon: const Icon(
                    Icons.home_outlined,
                    color: MyColors.secondary1,
                  ))),
          Expanded(
              child: IconButton(
                  onPressed: index1,
                  icon: const Icon(
                    Icons.search,
                    color: MyColors.secondary1,
                  ))),
          Expanded(
              child: IconButton(
                  onPressed: bottomButtom,
                  icon: const Icon(
                    Icons.add_box_outlined,
                    color: MyColors.secondary1,
                  ))),
          Expanded(
              child: IconButton(
                  onPressed: index2,
                  icon: const Icon(
                    Icons.redeem_rounded,
                    color: MyColors.secondary1,
                  ))),
          Expanded(
              child: IconButton(
                  onPressed: index3,
                  icon: const Icon(
                    Icons.person_2_outlined,
                    color: MyColors.secondary1,
                  )))
        ],
      ),
    );
  }
}
