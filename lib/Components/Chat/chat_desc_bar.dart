import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_ups/Screens/Chat/chat_page.dart';
import 'package:sign_ups/Screens/Chat/in_chat.dart';

class ChatDescBar extends StatelessWidget {
  final String title;
  final String lastText;

  const ChatDescBar({
    Key? key,
    this.title = "",
    this.lastText = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => InChatPage(),
            transitionDuration: const Duration(seconds: 0),
          ),
        );
      },
      child: Container(
        width: size.width,
        height: 88,
        //add bar between each chat room
        decoration: BoxDecoration(
          color: const Color(0xFFe6e3ee),
          border: Border(
            top: BorderSide(width: 1.0, color: Colors.blueGrey),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    lastText,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
            IconButton(
              padding: EdgeInsets.only(left: 8),
              iconSize: 40,
              constraints: BoxConstraints(),
              icon: Icon(Icons.chevron_right_rounded),
              color: Colors.blueGrey,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ChatPage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
