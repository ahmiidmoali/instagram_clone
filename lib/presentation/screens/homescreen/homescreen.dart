import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:instagram_clone/bussiness_logic/mainposts/cubit/mainposts_cubit.dart';
import 'package:instagram_clone/bussiness_logic/posts/cubit/posts_cubit.dart';
import 'package:instagram_clone/bussiness_logic/searchpage/cubit/searchpage_cubit.dart';
import 'package:instagram_clone/core/constants/colors.dart';
import 'package:instagram_clone/core/constants/routes.dart';

import 'package:instagram_clone/main.dart';
import 'package:instagram_clone/presentation/screens/homescreen/homepage.dart';
import 'package:instagram_clone/presentation/screens/homescreen/profilepage.dart';
import 'package:instagram_clone/presentation/screens/homescreen/addPost.dart';
import 'package:instagram_clone/presentation/screens/homescreen/searchpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/images.dart';
import '../../../data/models/usermodel.dart';
import '../../../data/web_services/posts_web_services.dart';
import '../../widgets/homepage/custom_post_homepage_widget.dart';
import '../../widgets/homescreen/custom_bottom_navigationbar_homescreen.dart';

class HomeScreen extends StatefulWidget {
  final String userid;
  const HomeScreen({super.key, required this.userid});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //-------temporaryLogic-------

  int currentPage = 0;

  List mypages = [
    const HomePage(),
    SearchPage(),
    const AddPost(),
    const ProfilePage()
  ];
  setCurrentPage(int currentPage) {
    if (this.currentPage != currentPage) {
      this.currentPage = currentPage;
      print(currentPage);
      setState(() {});
    }
  }

  @override
  void initState() {
    BlocProvider.of<MainPostsCubit>(context).getAllMainPosts(widget.userid);
    BlocProvider.of<PostsCubit>(context).getAllPosts(widget.userid);
    BlocProvider.of<SearchpageCubit>(context).getAllPosts(widget.userid);

    // getdata();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.background,
        leadingWidth: 150,
        actions: [
          CustomPostIconButton(
            icon: Icons.favorite_border_outlined,
            onPressed: () {},
          ),
          CustomPostIconButton(
            icon: currentPage == 3
                ? Icons.settings
                : Icons.messenger_outline_outlined,
            onPressed: () {},
          )
        ],
        leading: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
              ),
              child: Image.asset(
                Myimages.loginlogo,
                width: 100,
                height: 50,
                color: MyColors.secondary1,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: CustomPostIconButton(
                icon: Icons.expand_more_outlined,
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
      backgroundColor: MyColors.background,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: customBottomNavigationBarHomeScreen(
          bottomButtom: () {
            Navigator.of(context).pushNamed(MyRoutes.addPost);
          },
          index0: () {
            setCurrentPage(0);
          },
          index1: () {
            setCurrentPage(1);
          },
          index2: () {
            setCurrentPage(2);
          },
          index3: () {
            setCurrentPage(3);
          },
        ),
      ),
      body: SizedBox(
        child: PageView(
          onPageChanged: (value) {},
          children: [mypages.elementAt(currentPage)],
        ),
      ),
    );
  }
}
