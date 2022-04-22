import 'package:flutter/material.dart';
import 'package:sign_ups/Components/Chat/chat_header_bar.dart';
import 'package:sign_ups/Components/Chat/chat_message.dart';
import 'package:sign_ups/Screens/Chat/message_box.dart';

import '../../Components/bottom_navigation_bar.dart';
import '../../Components/menu_drawer.dart';
import '../../Components/spota_appbar.dart';

class InChatPage extends StatelessWidget {
  const InChatPage({Key? key}) : super(key: key);

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
              reverse: true, //newest message at the bottom
              children: <Widget>[
                //add chat message here
                /*ChatMessage(
                  sender: "Matt Yost",
                  initials: "MY",
                  dateTime: "Today at 3:08 PM",
                  message: "Same here!",
                  color: Colors.green,
                ),*/
              ],
            ),
          ),
          MessageBox(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(curIndex: 3),
    );
  }
}
