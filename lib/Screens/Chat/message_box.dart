import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sign_ups/auth/AuthenticationService.dart';

import '../../Components/rounded_input_field.dart';
import '../../main.dart';
import '../../model/Chat/chat_message.dart';

class MessageBox extends StatelessWidget {
  final String message;
  final String groupChatName;
  TextEditingController chatTBController = TextEditingController();
  MessageBox({
    Key? key,
    this.message = "",
    this.groupChatName = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 64,
      decoration: BoxDecoration(
        color: Colors.black12,
        border: Border(
          top: BorderSide(width: 1.0, color: Colors.blueGrey),
        ),
      ),
      //add bar between each chat room
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 40,
              icon: Icon(Icons.add),
              color: Colors.black45,
              onPressed: () {},
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              width: size.width * 0.69,
              child: TextField(
                //TODO: Fix this to make it nice bc idk how yall did it before
                controller: chatTBController,
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(),
                  labelText: 'Message',
                ),
              ),
            ),
            IconButton(
              iconSize: 28,
              icon: Icon(Icons.send),
              color: Colors.black45,
              onPressed: () {
                Message msg = Message(
                    messageContent: chatTBController.text.trim(),
                    groupChat: groupChatName,
                    senderId: FirebaseAuth.instance.currentUser!.displayName!,
                    //recipientId: '',
                    chatTimeStamp: DateTime.now().toString());
                AuthenticationService().saveMessage(message: msg);
                //listMessages.add(msg);
                //TODO: send a message with the message in the text field
                stompClient.send(
                    destination: '/app/chat', body: json.encode(msg));
                /* Timer.periodic(const Duration(seconds: 10), (_) {
                    Message chatMessage = Message(
                      messageContent: 'Hello, Griffin!',
                      senderId: '2', //username
                      recipientId: 'spota', //recipent user name
                      //chatId: '1',
                      groupChat: 'groupName',
                    );
                    stompClient.send(
                      destination: '/app/chat',
                      // headers: {},
                      body: json.encode(chatMessage.toMap()),
                    );
                  });*/
                chatTBController.text.trim();
                chatTBController.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}
