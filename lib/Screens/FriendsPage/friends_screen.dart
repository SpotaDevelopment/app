import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sign_ups/Components/bottom_navigation_bar.dart';
import 'package:sign_ups/constants/all_constants.dart';

import '../../Components/UserComponents/FriendInList.dart';
import '../../Components/menu_drawer.dart';
import '../../Components/spota_appbar.dart';
import '../../HelperFunctions/functions.dart';
import '../../constants/color_constants.dart';
import '../Profile/profile_screen.dart';

class FriendsScreen extends StatelessWidget {
  FriendsScreen({Key? key}) : super(key: key);
  var friends = [
    "Kevin O'Brien",
    "Matt Yost",
    "Brian Curtis",
    "Griffin Bourdon",
    "Phil Bourdon",
    "Ben Bosquet",
    "Peter Bugala",
    "Justin Rittmeyer",
    "Charles Colbourn",
    "Heewook Lee",
    "Ming Zhao",
    "Javier Gonzalez Sanchez",
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: SpotaAppBar(),
      endDrawer: MenuDrawer(),
      body: Column(
        children: [
          Container(
            height: size.height * 0.075,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border(
                top: BorderSide(width: 2, color: Colors.black),
                bottom: BorderSide(width: 2, color: Colors.black),
              ),
            ),
            child: Row(
              children: [
                SizedBox(width: size.width * 0.02),
                GestureDetector(
                  child: Icon(
                    Icons.chevron_left_outlined,
                    size: 35,
                  ),
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProfilePage();
                        },
                      ),
                    )
                  },
                ),
                Spacer(),
                Text(
                  "Friends",
                  style: TextStyle(
                    fontFamily: "Oxanium",
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                    letterSpacing: 1.1,
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                Icon(Icons.search_outlined, size: 35),
                SizedBox(width: size.width * 0.02),
              ],
            ),
          ),
          Container(
            color: lightGrey,
            child: SizedBox(
              height: size.height * 0.68,
              child: ListView.separated(
                padding: EdgeInsets.all(25),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: friends.length + 2,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Row(
                      children: [
                        SizedBox(
                            width: size.width * 0.015,
                            height: size.height * 0.05),
                        Text(
                          "Online",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        )
                      ],
                    );
                  } else if (index == friends.length + 1) {
                    return Row(
                      children: [
                        SizedBox(
                            width: size.width * 0.015,
                            height: size.height * 0.05),
                        Text(
                          "Offline",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        )
                      ],
                    );
                  }
                  return FriendInList(
                      name: friends[index - 1], color: getRandColor());
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.transparent,
                    thickness: 1,
                    height: 1,
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
