import 'package:flutter/material.dart';
import 'package:sign_ups/Components/bottom_navigation_bar.dart';
import 'package:sign_ups/constants.dart';

import '../../Components/menu_drawer.dart';
import '../../Components/spota_appbar.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({Key? key}) : super(key: key);

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
              height: size.height * 0.6,
              // child: ListView.separated(
              //   scrollDirection: Axis.vertical,
              //   shrinkWrap: true,
              //   physics: BouncingScrollPhysics(),
              //   itemCount
              // ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
