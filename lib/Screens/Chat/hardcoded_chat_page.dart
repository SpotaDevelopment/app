import 'package:flutter/material.dart';
import 'package:sign_ups/Components/Chat/chat_desc_bar.dart';
import 'package:sign_ups/Components/Chat/chat_header_bar.dart';

import '../../Components/bottom_navigation_bar.dart';
import '../../Components/menu_drawer.dart';
import '../../Components/spota_appbar.dart';

class HardcodedChatPage extends StatelessWidget {
  const HardcodedChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: SpotaAppBar(),
      endDrawer: MenuDrawer(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                ChatDescBar(title: "The Boys",
                    lastText: "Did you see Shohei Ohtani last night?!"),
                ChatDescBar(title: "Sun Devil Fans",
                    lastText: "I can't wait for the next Golf season"),
                ChatDescBar(title: "Team Nextiva",
                    lastText: "The Pac 12 is soooooo underrated"),
                ChatDescBar(title: "Kevin O'Brien",
                    lastText: "Justin Herbert is a top 3 qb in the NFL"),
                ChatDescBar(title: "Griffin Bourdon",
                    lastText: "The Rockies are a dumpster fire again"),
                ChatDescBar(title: "Matt Yost",
                    lastText: "Look at this pickle ball highlight"),
                ChatDescBar(title: "Brian Curtis",
                    lastText: "Devin Booker deserves the MVP"),
                ChatDescBar(title: "Engineering Squad",
                    lastText: "The 49ers lost...I hope our boss is okay"),
                ChatDescBar(title: "The Girls",
                    lastText: "That was an incredible pass"),
                ChatDescBar(title: "The Work Crew",
                    lastText: "Look at that teamwork!"),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar( curIndex: 3),
    );
  }
}
