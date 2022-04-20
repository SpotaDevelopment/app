import 'package:flutter/material.dart';
import 'package:sign_ups/Components/Chat/chat_header_bar.dart';
import 'package:sign_ups/Components/Chat/chat_message.dart';
import 'package:sign_ups/Screens/Chat/message_box.dart';

import '../../Components/bottom_navigation_bar.dart';
import '../../Components/menu_drawer.dart';
import '../../Components/spota_appbar.dart';

class HardcodedInChatPage extends StatelessWidget {
  const HardcodedInChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFe6e3ee),
      appBar: SpotaAppBar(),
      endDrawer: MenuDrawer(),
      body: Column(
        children: <Widget>[
          ChatHeaderBar(title: "The Boys"),
          Expanded(
            child: ListView(
              reverse: true,      //newest message at the bottom
              children: <Widget>[
                ChatMessage(
                  sender: "Matt Yost",
                  initials: "MY",
                  dateTime: "Today at 3:08 PM",
                  message: "Same here!",
                  color: Colors.green,
                ),
                ChatMessage(
                  sender: "Brian Curtis",
                  initials: "BC",
                  message: "I'm for Tiger Woods",
                  dateTime: "Today at 3:07 PM",
                  color: Colors.pink,
                ),
                ChatMessage(
                  sender: "Griffin Bourdon",
                  initials: "GB",
                  dateTime: "Today at 3:05 PM",
                  message: "The Rockies are trash too",
                  color: Colors.deepPurple,
                ),
                ChatMessage(
                  sender: "Brian Curtis",
                  initials: "BC",
                  message: "The Masters also start today...",
                  dateTime: "Today at 3:04 PM",
                  color: Colors.pink,
                ),
                ChatMessage(
                  sender: "Kevin O'Brien",
                  initials: "KO",
                  message: "I am! But the dbacks are trash",
                  dateTime: "Today at 3:04 PM",
                  color: Colors.blue,
                ),
                ChatMessage(
                  sender: "Matt Yost",
                  initials: "MY",
                  dateTime: "Today at 3:03 PM",
                  message: "Who's excited for opening day?!",
                  color: Colors.green,
                ),
                ChatMessage(
                  sender: "Griffin Bourdon",
                  initials: "GB",
                  dateTime: "Today at 3:01 PM",
                  message: "howdy",
                  color: Colors.deepPurple,
                ),
                ChatMessage(
                  sender: "Kevin O'Brien",
                  initials: "KO",
                  message: "Sup y'all",
                  dateTime: "Today at 3:01 PM",
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          MessageBox(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
