import 'package:flutter/material.dart';
import 'package:sign_ups/Screens/Chat/chat_page.dart';

class ChatHeaderBar extends StatelessWidget {
  final String title;

  const ChatHeaderBar({
    Key? key,
    this.title = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 56,
      color: Color(0xFFC4C4C4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            padding: EdgeInsets.only(left: 8),
            iconSize: 36,
            constraints: BoxConstraints(),
            icon: Icon(Icons.chevron_left_rounded),
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => ChatPage(),
                  transitionDuration: const Duration(seconds: 0),
                ),
              );
            },
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            padding: EdgeInsets.only(right: 8),
            iconSize: 28,
            constraints: BoxConstraints(),
            icon: Icon(Icons.info_outlined),
            color: Colors.black,
            onPressed: () {}, //TODO: add information view like people in chat
          ),
        ],
      ),
    );
  }
}
