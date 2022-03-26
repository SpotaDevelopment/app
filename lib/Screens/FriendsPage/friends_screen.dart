import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sign_ups/Components/bottom_navigation_bar.dart';
import 'package:sign_ups/constants.dart';

import '../../Components/UserComponents/FriendInList.dart';
import '../../Components/menu_drawer.dart';
import '../../Components/spota_appbar.dart';

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

  var colors = [
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.purple
  ];

  Color getRandColor() {
    var rnd = new Random();
    int r = rnd.nextInt(colors.length - 1);
    return colors[r];
  }

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
                Icon(
                  Icons.chevron_left_outlined,
                  size: 35,
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
              height: size.height * 0.675,
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: friends.length,
                itemBuilder: (context, index) {
                  return FriendInList(
                      name: friends[index], color: getRandColor());
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
