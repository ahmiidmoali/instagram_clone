import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/bussiness_logic/auth/signup/cubit/signup_cubit.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/constants/images.dart';
import 'package:instagram_clone/core/shared/loadingscreen.dart';
import 'package:instagram_clone/presentation/widgets/Authentication/login/customtextbutton_login.dart';
import '../../../core/functions/validinput.dart';
import '../../widgets/Authentication/login/custombutton_login.dart';
import '../../widgets/Authentication/signup/customtextformfield_signup.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  GlobalKey<FormState> formstateSignup = GlobalKey();
  late TextEditingController usernameController;
  late TextEditingController fullnameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  letsSignUp() async {
    if (formstateSignup.currentState!.validate()) {
      await BlocProvider.of<SignupCubit>(context).trySignUp(
          usernameController.text,
          fullnameController.text,
          emailController.text,
          passwordController.text);
    }
  }

  @override
  void initState() {
    usernameController = TextEditingController();
    fullnameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: formstateSignup,
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
                CustomTextFormFieldSignup(
                  controller: emailController,
                  validator: (value) {
                    return validInput(value!, 7, 200, Validtype.email);
                  },
                  hintText: "Email adress",
                ),
                CustomTextFormFieldSignup(
                  controller: fullnameController,
                  validator: (value) {
                    return validInput(value!, 7, 200, Validtype.somthingelse);
                  },
                  hintText: "Fullname",
                ),
                CustomTextFormFieldSignup(
                  controller: usernameController,
                  validator: (value) {
                    return validInput(value!, 5, 200, Validtype.somthingelse);
                  },
                  hintText: "Username",
                ),
                CustomTextFormFieldSignup(
                  controller: passwordController,
                  validator: (value) {
                    return validInput(value!, 7, 200, Validtype.somthingelse);
                  },
                  hintText: "Password",
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocConsumer<SignupCubit, SignupState>(
                  listener: (context, state) {
                    if (state is SignupSuccess) {
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          "Done! now log in",
                          style: TextStyle(
                              fontSize: 20, color: MyColors.secondary1),
                        ),
                      ));
                    }
                  },
                  builder: (context, state) {
                    if (state is SignupLoading) {
                      return const LoadingScreen(width: 30);
                    }
                    return CustomButtonLogin(
                      onPressed: () {
                        letsSignUp();
                      },
                      nameOfButton: "sign up",
                    );
                  },
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
                      style:
                          TextStyle(fontSize: 15, color: MyColors.secondary1),
                    ),
                    CustomTextButtonLogin(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        data: "Log in")
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
