import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/images.dart';
import 'package:instagram_clone/presentation/screens/Authentication/signup.dart';
import 'package:instagram_clone/presentation/screens/homescreen/homescreen.dart';
import 'package:instagram_clone/presentation/widgets/Authentication/login/customtextbutton_login.dart';

import '../../widgets/Authentication/login/custombutton_login.dart';
import '../../widgets/Authentication/login/customtextformfield_login.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            children: [
              const SizedBox(
                height: 200,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: Image.asset(
                  Myimages.loginlogo,
                  width: double.infinity,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              const CustomTextFormFieldLogin(
                hintText: "Phone number, username or email adress",
              ),
              const CustomTextFormFieldLogin(
                hintText: "Password",
              ),
              Row(
                children: [
                  const Spacer(),
                  CustomTextButtonLogin(
                      onPressed: () {}, data: "Forgotten password?")
                ],
              ),
              CustomButtonLogin(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const homeScreen(),
                  ));
                },
                nameOfButton: "log in",
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                  height: 100,
                  child: const Divider(
                    color: Colors.black,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 15, color: Colors.blue),
                  ),
                  CustomTextButtonLogin(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const signup(),
                        ));
                      },
                      data: "Sign up")
                ],
              ),
            ],
          )),
    );
  }
}
