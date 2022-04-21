import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sign_ups/Components/Chat/chat_desc_bar.dart';
import 'package:sign_ups/Components/Chat/chat_header_bar.dart';
import 'package:sign_ups/constants/all_constants.dart';

import '../../Components/bottom_navigation_bar.dart';
import '../../Components/menu_drawer.dart';
import '../../Components/spota_appbar.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: SpotaAppBar(),
      endDrawer: MenuDrawer(),
      body: Stack(
        children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  //this is where chat descriptions go, like
                  /*ChatDescBar(title: "The Boys",
                      lastText: "Did you see Shohei Ohtani last night?!"),*/
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(size.width *.82, size.height * .667, 16, 8),
            child: FloatingActionButton(
              //new chat button
              backgroundColor: secondaryColor,
              onPressed: () {
                createAlertDialog(context);
              },
              child: const Icon(
                Icons.add_comment_outlined,
                size: 35,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  createAlertDialog(BuildContext context) {
    TextEditingController customController = TextEditingController();
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Create a new chat"),
            content: TextField(
              controller: customController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Add User',
              ),
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                color: secondaryColor,
                child: const Text("Create Chat"),
                onPressed: () {
                  //sends out the value of the text field text
                  Navigator.of(context).pop(customController.text.toString());
                }, //TODO: create the chat
              ),
            ],
          );
        });
  }
}
