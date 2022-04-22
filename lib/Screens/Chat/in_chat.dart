import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:sign_ups/Components/Chat/chat_header_bar.dart';
import 'package:sign_ups/Screens/Chat/message_box.dart';
import 'package:sign_ups/main.dart';

import '../../Components/Chat/chat_message.dart';
import '../../Components/bottom_navigation_bar.dart';
import '../../Components/menu_drawer.dart';
import '../../Components/spota_appbar.dart';
import '../../HelperFunctions/functions.dart';
import '../../auth/AuthenticationService.dart';
import '../../model/Chat/chat_message.dart';
import '../../model/Chat/conversation.dart';

class InChatPage extends StatefulWidget {
  Conversation conversation;

  InChatPage({
    Key? key,
    required this.conversation,
  }) : super(key: key);

  @override
  State<InChatPage> createState() => _InChatPageState();
}

class _InChatPageState extends State<InChatPage> {
  //late Future<List<Message>> futureMessages;
  @override
  void initState() {
    super.initState();
    //futureMessages = AuthenticationService()
    // .fetchMessages(chatId: widget.conversation.groupChatName);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFFe6e3ee),
      appBar: SpotaAppBar(),
      endDrawer: MenuDrawer(),
      body: Column(
        children: <Widget>[
          ChatHeaderBar(title: widget.conversation.groupChatName!),
          Expanded(
            child: StreamBuilder(
              initialData: widget.conversation.messageList,
              stream: streamController2.stream,
              //stream: streamController.stream,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Message>> snapshot) {
                return _conversationView(snapshot);
                /*return RefreshIndicator(
                  child: _conversationView(snapshot),
                  onRefresh: _pull,
                );*/
              },
            ),
          ),
          MessageBox(
              groupChatName: widget.conversation.groupChatName ?? 'Group Chat'),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _conversationView(AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      return ListView.builder(
        reverse: true,
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          // return snapshot.data[index];
          return ChatMessage(
            sender: snapshot.data[index].senderId,
            initials: getInitials(snapshot.data[index].senderId),
            dateTime: formatDate(snapshot.data[index].chatTimeStamp),
            message: snapshot.data[index].messageContent,
            color: Colors.green, //add user color
            //   //message: snapshot.data[index].message,
            //   //time: snapshot.data[index].time,
            //   //isMe: snapshot.data[index].isMe,
          );
        },
      );
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    }
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Future<void> _pull() async {
    setState(() {
      // futureMessages = AuthenticationService()
      //   .fetchMessages(chatId: widget.conversation.groupChatName);
    });
  }

  // Future<void> _pull() async {
  //   setState(() {
  //     var newMsg = Message(
  //         chatId: "",
  //         messageContent: "",
  //         senderId: "",
  //         recipientId: "",
  //         chatTimeStamp: "");
  //    // futureMessages.add(newMsg);
  //   });
  //}
}

formatDate(chatTimeStamp) {
  var date = DateTime.parse(chatTimeStamp);
  var formatter = new DateFormat('dd-MM-yyyy');
  return formatter.format(date);
}
