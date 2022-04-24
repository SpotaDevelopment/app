import 'package:flutter/material.dart';
import 'package:sign_ups/Components/Chat/chat_desc_bar.dart';
import 'package:sign_ups/Components/Chat/chat_header_bar.dart';

import '../../Components/bottom_navigation_bar.dart';
import '../../Components/menu_drawer.dart';
import '../../Components/spota_appbar.dart';
import '../../model/Chat/conversation.dart';

class HardcodedChatPage extends StatelessWidget {
  const HardcodedChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Conversation temp =
        Conversation(groupChatName: "Hardcoded Chat", messageList: null);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: SpotaAppBar(),
      endDrawer: MenuDrawer(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                ChatDescBar(
                  title: "The Boys",
                  lastText: "Did you see Shohei Ohtani last night?!",
                  conversation: temp,
                ),
                ChatDescBar(
                  title: "Sun Devil Fans",
                  lastText: "I can't wait for the next Golf season",
                  conversation: temp,
                ),
                ChatDescBar(
                    title: "Team Nextiva",
                    lastText: "The Pac 12 is soooooo underrated",
                    conversation: temp),
                ChatDescBar(
                    title: "Kevin O'Brien",
                    lastText: "Justin Herbert is a top 3 qb in the NFL",
                    conversation: temp),
                ChatDescBar(
                    title: "Griffin Bourdon",
                    lastText: "The Rockies are a dumpster fire again",
                    conversation: temp),
                ChatDescBar(
                    title: "Matt Yost",
                    lastText: "Look at this pickle ball highlight",
                    conversation: temp),
                ChatDescBar(
                    title: "Brian Curtis",
                    lastText: "Devin Booker deserves the MVP",
                    conversation: temp),
                ChatDescBar(
                    title: "Engineering Squad",
                    lastText: "The 49ers lost...I hope our boss is okay",
                    conversation: temp),
                ChatDescBar(
                    title: "The Girls",
                    lastText: "That was an incredible pass",
                    conversation: temp),
                ChatDescBar(
                    title: "The Work Crew",
                    lastText: "Look at that teamwork!",
                    conversation: temp),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar( curIndex: 3),
    );
  }
}
