import 'package:flutter/material.dart';
import 'package:instagram_clone/constants/images.dart';

class profilePage extends StatelessWidget {
  const profilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey),
                  child: Image.asset(
                    Myimages.profile,
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill,
                  )),
              Row(
                children: const [
                  customFollowingPostsForProfile(
                    dataInt: "21",
                    dataString: "Posts",
                  ),
                  customFollowingPostsForProfile(
                    dataInt: "563",
                    dataString: "Followers",
                  ),
                  customFollowingPostsForProfile(
                    dataInt: "172",
                    dataString: "Following",
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "ahmed ali",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(),
              customMidButtonProfile(data: "Edit profile"),
              customMidButtonProfile(data: "Share profile"),
              Expanded(
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.person_add_alt_sharp,
                      size: 20,
                    )),
              )
            ],
          )
        ],
      ),
    );
  }
}

class customFollowingPostsForProfile extends StatelessWidget {
  final String dataInt;
  final String dataString;
  const customFollowingPostsForProfile(
      {super.key, required this.dataInt, required this.dataString});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            dataInt,
            style: const TextStyle(fontSize: 30),
          ),
          Text(
            dataString,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class customMidButtonProfile extends StatelessWidget {
  final String data;

  const customMidButtonProfile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width / 2.7,
      height: 30,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: MaterialButton(
        onPressed: () {},
        child: Text(
          data,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
