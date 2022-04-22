import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_ups/Components/bottom_navigation_bar.dart';
import 'package:sign_ups/UserServices/userServices.dart';
import 'package:sign_ups/constants/all_constants.dart';

import '../../Components/UserComponents/FriendInList.dart';
import '../../Components/menu_drawer.dart';
import '../../Components/spota_appbar.dart';
import '../../HelperFunctions/functions.dart';
import '../../constants/color_constants.dart';
import '../../model/UserAccount.dart';
import '../Profile/profile_screen.dart';

class FriendsScreen extends StatelessWidget {
  List<UserAccount?> friends = [];
  FriendsScreen({
    Key? key,
    required this.friends,
  }) : super(key: key);
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
                  onTap: () async {
                    if (globalUserAccount == null)
                      globalUserAccount = await getUserAccountByEmail(
                          FirebaseAuth.instance.currentUser?.email);
                    List<UserAccount?> friendList =
                        await getFriendsByEmail(globalUserAccount.email.trim());
                    List<String?> favoriteTeamList =
                        await getFavoriteTeams(globalUserAccount.email.trim());
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ProfilePage(
                            friends: friendList,
                            isPersonal: true,
                            identifier: globalUserAccount.firstName != ""
                                ? globalUserAccount.firstName! +
                                    " " +
                                    globalUserAccount.lastName
                                : globalUserAccount.username,
                            favoriteTeamList: favoriteTeamList,
                            color: colorStringsToColors[
                                globalUserAccount.profilePicColor],
                          );
                        },
                      ),
                    );
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
                // Icon(Icons.search_outlined, size: 35),
                SizedBox(width: size.width * 0.1),
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
                itemCount: friends.length,
                itemBuilder: (context, index) {
                  // if (index == 0) {
                  //   return Row(
                  //     children: [
                  //       SizedBox(
                  //           width: size.width * 0.015,
                  //           height: size.height * 0.05),
                  //       Text(
                  //         "Online",
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 24,
                  //         ),
                  //       )
                  //     ],
                  //   );
                  // } else if (index == friends.length + 1) {
                  //   return Row(
                  //     children: [
                  //       SizedBox(
                  //           width: size.width * 0.015,
                  //           height: size.height * 0.05),
                  //       Text(
                  //         "Offline",
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 24,
                  //         ),
                  //       )
                  //     ],
                  //   );
                  // }
                  String? fullName = friends[index]!.firstName! +
                      " " +
                      friends[index]!.lastName!;
                  return FriendInList(
                    name: fullName,
                    color:
                        colorStringsToColors[friends[index]!.profilePicColor!],
                    fullNameInitials: getInitials(fullName),
                  );
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
