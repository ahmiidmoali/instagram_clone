import 'package:flutter/material.dart';
import 'package:instagram_clone/presentation/screens/homescreen/homepage.dart';
import 'package:instagram_clone/presentation/screens/homescreen/profilepage.dart';
import 'package:instagram_clone/presentation/screens/homescreen/reelspage.dart';
import 'package:instagram_clone/presentation/screens/homescreen/searchpage.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  List mypages = [
    const homePage(),
    const reelsPage(),
    const searchPage(),
    const profilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const customBottomNavigationBarHomeScreen(),
      body: SizedBox(
        child: PageView(
          onPageChanged: (value) {},
          children: [mypages.elementAt(3)],
        ),
      ),
    );
  }
}

class customBottomNavigationBarHomeScreen extends StatelessWidget {
  const customBottomNavigationBarHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5))),
      child: Row(
        children: [
          Expanded(
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.home_outlined))),
          Expanded(
              child:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search))),
          Expanded(
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.dynamic_feed_outlined))),
          Expanded(
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.person_2_outlined)))
        ],
      ),
    );
  }
}
