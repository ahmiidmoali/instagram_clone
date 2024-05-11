import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/images.dart';
import '../../../data/models/allusers.dart';

class CustomListTileSearch extends StatelessWidget {
  final List<AllUsers> searched;
  const CustomListTileSearch({super.key, required this.searched});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
            searched.length,
            (index) => ListTile(
                leading: Image.asset(Myimages.profile),
                title: Text(
                  "${searched[index].usersFullname}",
                  style: const TextStyle(color: MyColors.secondary1),
                ),
                subtitle: Text(
                  "${searched[index].usersName}",
                  style: const TextStyle(color: MyColors.secondary1),
                )))
      ],
    );
  }
}
