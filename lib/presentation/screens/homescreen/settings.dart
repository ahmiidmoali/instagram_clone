import 'package:flutter/material.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/constants/routes.dart';
import 'package:instagram_clone/main.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      appBar: AppBar(
        title: const Text(
          "Settings and activity",
          style: TextStyle(fontSize: 20, color: MyColors.secondary1),
        ),
        backgroundColor: MyColors.background,
      ),
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              sharedPreferences.clear();
              Navigator.of(context).pushReplacementNamed(MyRoutes.loginScreen);
            },
            child: const Text(
              "log out",
              style: TextStyle(
                  fontSize: 20, color: Colors.red, fontWeight: FontWeight.w300),
            ),
          )
        ],
      ),
    );
  }
}
