import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/bussiness_logic/auth/login/cubit/login_cubit.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/constants/images.dart';
import 'package:instagram_clone/core/constants/routes.dart';
import 'package:instagram_clone/core/functions/validinput.dart';
import 'package:instagram_clone/presentation/widgets/Authentication/login/customtextbutton_login.dart';
import '../../../data/models/allusers.dart';
import '../../widgets/Authentication/login/custombutton_login.dart';
import '../../widgets/Authentication/login/customtextformfield_login.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<AllUsers> user = [];
  GlobalKey<FormState> formstate = GlobalKey();
  late TextEditingController emailController;
  late TextEditingController passwordController;

  letslogin() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      await BlocProvider.of<LoginCubit>(context)
          .tryLogin("email", emailController.text, passwordController.text);
    }
  }

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  // @override
  // void dispose() {
  //   emailController.clear();
  //   passwordController.clear();

  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      body: Form(
        key: formstate,
        child: Container(
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
                CustomTextFormFieldLogin(
                  validator: (value) {
                    return validInput(value!, 7, 200, Validtype.email);
                  },
                  controller: emailController,
                  hintText: "Phone number, username or email adress",
                ),
                CustomTextFormFieldLogin(
                  validator: (value) {
                    return validInput(value!, 7, 15, Validtype.somthingelse);
                  },
                  controller: passwordController,
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
                BlocListener<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginLoaded) {
                      user = BlocProvider.of<LoginCubit>(context).user;
                      Navigator.of(context)
                          .pushNamed(MyRoutes.homeScreen, arguments: user[0]);
                    }
                    if (state is LoginFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          "Wrong email or password",
                          style: TextStyle(
                              fontSize: 20, color: MyColors.secondary1),
                        ),
                      ));
                    }
                  },
                  child: CustomButtonLogin(
                    onPressed: () async {
                      await letslogin();
                    },
                    nameOfButton: "log in",
                  ),
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
                      style:
                          TextStyle(fontSize: 15, color: MyColors.secondary1),
                    ),
                    CustomTextButtonLogin(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(MyRoutes.signupScreen);
                        },
                        data: "Sign up")
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
