import 'package:flutter/material.dart';
import 'package:sign_ups/Components/bottom_navigation_bar.dart';

import '../../Components/menu_drawer.dart';
import '../../Components/spota_appbar.dart';
import '../../constants/color_constants.dart';
import '../Profile/personal_profile_screen.dart';

class FindFriendsScreen extends StatelessWidget {
  FindFriendsScreen({Key? key}) : super(key: key);
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
                          return PersonalProfilePage();
                        },
                      ),
                    )
                  },
                ),
                Spacer(),
                Text(
                  "Find Friends",
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
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
