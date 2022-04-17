import 'package:flutter/material.dart';
import 'package:sign_ups/Components/bottom_navigation_bar.dart';
import 'package:sign_ups/Components/rounded_input_field.dart';

import '../../Components/menu_drawer.dart';
import '../../Components/spota_appbar.dart';
import '../../constants/color_constants.dart';
import '../Profile/personal_profile_screen.dart';

class FindFriendsScreen extends StatefulWidget {
  FindFriendsScreen({Key? key}) : super(key: key);
  @override
  State<FindFriendsScreen> createState() => _FindFriendsScreenState();
}

class _FindFriendsScreenState extends State<FindFriendsScreen> {
  final TextEditingController findFriendsController = TextEditingController();
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
                RoundedInputField(
                  controller: findFriendsController,
                  hintText: "Search by username or email",
                  icon: Icons.search,
                  onChanged: (value) {},
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
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Container();
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
