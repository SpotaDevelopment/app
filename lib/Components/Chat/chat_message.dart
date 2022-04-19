import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String sender, message, profilePicture, initials, dateTime;
  final MaterialColor color;


  const ChatMessage({
    Key? key,
    this.sender = "",
    this.message = "",
    this.profilePicture = "",
    this.initials = "",
    this.dateTime = "",
    this.color = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 80,
      //add bar between each chat room
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(         //TODO: change this to profile pic
              radius: 28,
              backgroundColor: color,
              child: Text(initials,
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: "Oxanium",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(sender + "  ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Text(dateTime,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
              Text(message,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}