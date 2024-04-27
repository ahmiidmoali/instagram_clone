import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_clone/bussiness_logic/mainposts/cubit/mainposts_cubit.dart';
import 'package:instagram_clone/bussiness_logic/posts/cubit/posts_cubit.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/presentation/screens/homescreen/homepage.dart';
import 'package:instagram_clone/presentation/screens/homescreen/profilepage.dart';
import 'package:instagram_clone/presentation/screens/homescreen/reelspage.dart';
import 'package:instagram_clone/presentation/screens/homescreen/searchpage.dart';

import '../../../constants/images.dart';
import '../../../data/web_services/posts_web_services.dart';
import '../../widgets/homepage/custom_post_homepage_widget.dart';
import '../../widgets/homescreen/custom_bottom_navigationbar_homescreen.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  //-------temporaryLogic-------
  int currentPage = 0;
  List mypages = [
    const homePage(),
    const reelsPage(),
    const searchPage(),
    const profilePage()
  ];
  setCurrentPage(int currentPage) {
    if (this.currentPage != currentPage) {
      this.currentPage = currentPage;
      print(currentPage);
      setState(() {});
    }
  }

  // PostsWebServices postsWebServices = PostsWebServices();
  // getdata() async {
  //   await postsWebServices.getAllPosts();
  // }

  @override
  void initState() {
    BlocProvider.of<PostsCubit>(context).getAllPosts();
    BlocProvider.of<MainPostsCubit>(context).getAllMainPosts("2");
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
            icon: Icons.messenger_outline_outlined,
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
      bottomNavigationBar: customBottomNavigationBarHomeScreen(
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
      body: SizedBox(
        child: PageView(
          onPageChanged: (value) {},
          children: [mypages.elementAt(currentPage)],
        ),
      ),
    );
  }
}
