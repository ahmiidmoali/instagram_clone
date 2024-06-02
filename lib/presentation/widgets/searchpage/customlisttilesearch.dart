import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/images.dart';
import '../../../core/constants/links.dart';
import '../../../core/constants/routes.dart';
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
            (index) => InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, MyRoutes.otherprofileScreen,
                        arguments: searched[index].usersId.toString());
                  },
                  child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: searched[index].usersProfilepic! == "null"
                            ? Image.asset(
                                Myimages.profile,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                MyLink.imagesLink +
                                    searched[index].usersProfilepic!,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                      ),
                      title: Text(
                        "${searched[index].usersFullname}",
                        style: const TextStyle(color: MyColors.secondary1),
                      ),
                      subtitle: Text(
                        "${searched[index].usersName}",
                        style: const TextStyle(color: MyColors.secondary1),
                      )),
                ))
      ],
    );
  }
}
