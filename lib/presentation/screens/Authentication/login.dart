import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/constants/images.dart';
import 'package:instagram_clone/constants/routes.dart';
import 'package:instagram_clone/presentation/screens/Authentication/signup.dart';
import 'package:instagram_clone/presentation/screens/homescreen/homescreen.dart';
import 'package:instagram_clone/presentation/screens/homescreen/profilepage.dart';
import 'package:instagram_clone/presentation/widgets/Authentication/login/customtextbutton_login.dart';

import '../../../bussiness_logic/posts/cubit/posts_cubit.dart';
import '../../widgets/Authentication/login/custombutton_login.dart';
import '../../widgets/Authentication/login/customtextformfield_login.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  late TextEditingController emailController;
  late TextEditingController PasswordController;
  @override
  void initState() {
    emailController = TextEditingController();
    PasswordController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            children: [
              const SizedBox(
                height: 200,
              ),
              //--------------loginlogo--------------------
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
              //--------------TextFormField X2--------------------
              const CustomTextFormFieldLogin(
                hintText: "Phone number, username or email adress",
              ),
              const CustomTextFormFieldLogin(
                hintText: "Password",
              ),
              //--------------"Forgotten password?"--------------------
              Row(
                children: [
                  const Spacer(),
                  CustomTextButtonLogin(
                      onPressed: () {}, data: "Forgotten password?")
                ],
              ),
              //--------------login button--------------------
              CustomButtonLogin(
                onPressed: () {
                  Navigator.of(context).pushNamed(MyRoutes.homeScreen);
                },
                nameOfButton: "log in",
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                  height: 100,
                  child: const Divider(
                    color: Colors.black,
                  )),
              //--------------Don't have an account?--------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 15, color: MyColors.secondary1),
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
