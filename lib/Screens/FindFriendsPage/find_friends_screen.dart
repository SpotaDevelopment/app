import 'package:flutter/material.dart';
import 'package:sign_ups/Components/bottom_navigation_bar.dart';
import 'package:sign_ups/Components/rounded_input_field.dart';
import 'package:sign_ups/Screens/SignUp/signup_screen.dart';

import '../../Components/UserComponents/DefaultUserProfile.dart';
import '../../Components/UserComponents/FriendInList.dart';
import '../../Components/menu_drawer.dart';
import '../../Components/spota_appbar.dart';
import '../../HelperFunctions/functions.dart';
import '../../UserServices/userServices.dart';
import '../../constants/color_constants.dart';
import '../../model/UserAccount.dart';
import '../Profile/profile_screen.dart';

class FindFriendsScreen extends StatefulWidget {
  FindFriendsScreen({Key? key}) : super(key: key);
  @override
  State<FindFriendsScreen> createState() => _FindFriendsScreenState();
}

class _FindFriendsScreenState extends State<FindFriendsScreen> {
  final TextEditingController findFriendsController = TextEditingController();
  List<UserAccount>? searchedUsers;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: SpotaAppBar(),
      endDrawer: MenuDrawer(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Column(
            children: [
              Container(
                height: size.height * 0.073,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border(
                    top: BorderSide(width: 2, color: Colors.black),
                    bottom: BorderSide(width: 2, color: Colors.black),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: size.width * 0.02),
                    RoundedInputField(
                      controller: findFriendsController,
                      hintText: "Search by username or email",
                      icon: Icons.search,
                      onChanged: (value) async {
                        if (value != "") {
                          bool isEmail = value.contains('@');
                          searchedUsers =
                              await getUsersByPrefixService(value, isEmail);
                          setState(() {
                            searchedUsers;
                          });
                          if (searchedUsers?.length == 0) {
                            print("No users found");
                          }
                        } else {
                          setState(() {
                            searchedUsers = [];
                          });
                        }
                      },
                    ),
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
                    itemCount:
                        searchedUsers != null ? searchedUsers!.length : 0,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: FriendInList(
                            fullNameInitials:
                                searchedUsers![index].firstName != ""
                                    ? searchedUsers![index]
                                            .firstName![0]
                                            .toUpperCase() +
                                        searchedUsers![index]
                                            .lastName![0]
                                            .toUpperCase()
                                    : "",
                            name: searchedUsers![index].username!.isNotEmpty
                                ? searchedUsers![index].username
                                : searchedUsers![index].email,
                            color: colorStringsToColors[
                                searchedUsers![index].profilePicColor],
                            addIcon: true,
                            user: globalUserAccount.email.trim(),
                            friend: searchedUsers![index].email),
                        onTap: () async {
                          List<UserAccount?> friendList =
                              await getFriendsByEmail(
                                  searchedUsers![index].email);
                          List<String?> favoriteTeams = await getFavoriteTeams(
                              searchedUsers![index].email);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ProfilePage(
                                  friends: friendList,
                                  isPersonal: false,
                                  identifier:
                                      searchedUsers![index].firstName != ""
                                          ? searchedUsers![index].firstName! +
                                              " " +
                                              searchedUsers![index].lastName!
                                          : searchedUsers![index].username,
                                  favoriteTeamList: favoriteTeams,
                                  color: colorStringsToColors[
                                      searchedUsers![index].profilePicColor],
                                );
                              },
                            ),
                          );
                        },
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
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
