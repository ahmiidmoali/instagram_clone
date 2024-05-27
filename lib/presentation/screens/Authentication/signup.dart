import 'package:flutter/material.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/constants/images.dart';
import 'package:instagram_clone/presentation/widgets/Authentication/login/customtextbutton_login.dart';

import '../../widgets/Authentication/login/custombutton_login.dart';
import '../../widgets/Authentication/login/customtextformfield_login.dart';
import '../../widgets/Authentication/signup/customtextformfield_signup.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: Image.asset(
                  Myimages.loginlogo,
                  color: MyColors.secondary1,
                  width: double.infinity,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              const CustomTextFormFieldSignup(
                hintText: "Phone number or email adress",
              ),
              const CustomTextFormFieldSignup(
                hintText: "Fullname",
              ),
              const CustomTextFormFieldSignup(
                hintText: "Username",
              ),
              const CustomTextFormFieldSignup(
                hintText: "Password",
              ),
              const SizedBox(
                height: 30,
              ),
              CustomButtonLogin(
                onPressed: () {},
                nameOfButton: "sign up",
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
                    "Already have an account?",
                    style: TextStyle(fontSize: 15, color: MyColors.secondary1),
                  ),
                  CustomTextButtonLogin(onPressed: () {}, data: "Log in")
                ],
              ),
            ],
          )),
    );
  }
}
