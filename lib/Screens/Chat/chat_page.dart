import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sign_ups/Components/Chat/chat_desc_bar.dart';
import 'package:sign_ups/Components/Chat/chat_header_bar.dart';
import 'package:sign_ups/constants/all_constants.dart';

import '../../Components/bottom_navigation_bar.dart';
import '../../Components/menu_drawer.dart';
import '../../Components/spota_appbar.dart';
import '../../auth/AuthenticationService.dart';
import '../../model/Chat/conversation.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late Future<List<Conversation>> futureConversations;
  @override
  void initState() {
    super.initState();
    futureConversations = AuthenticationService().fetchConversations();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: SpotaAppBar(),
      endDrawer: MenuDrawer(),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            //   mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: FutureBuilder(
                  future: futureConversations,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    return RefreshIndicator(
                      child: _conversationView(snapshot),
                      onRefresh: _pull,
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                size.width * .82, size.height * .667, 16, 8),
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
    TextEditingController chatNameController = TextEditingController();
    TextEditingController userToAddController = TextEditingController();
    return showDialog(
      context: context,
      builder: (context) {
        //add an exit button at the top right of the alert dialog

        return AlertDialog(
          title: const Text("Create a new chat"),
          content: Column(
            //add padding between 2 text fields
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: chatNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Chat Name',
                ),
              ),
              //add a space between the text fields
              const SizedBox(height: 16),
              TextField(
                controller: userToAddController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Add User',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child:
                  const Text("Cancel", style: TextStyle(color: Colors.black)),
            ),
            MaterialButton(
                elevation: 5.0,
                color: secondaryColor,
                child: const Text("Create Chat"),
                onPressed: () {
                  AuthenticationService()
                      .createChat(
                          chatName: chatNameController.text.trim(),
                          user: userToAddController.text.trim())
                      .then((result) {
                    if (result == null) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ChatPage())); //push it to a new chat page with chat name title and containing the new person
                    } else {
                      // Handling error display
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            result,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      );
                    }
                  });
                }),
          ],
        );
      },
    );
  }

  Widget _conversationView(AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      return ListView.builder(
        //reverse: false,
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          return ChatDescBar(
            conversation: snapshot.data[snapshot.data.length - index - 1],
            title:
                snapshot.data[snapshot.data.length - index - 1].groupChatName,
            lastText: snapshot.data[snapshot.data.length - index - 1]
                        .messageList.length >
                    0
                ? snapshot
                    .data[snapshot.data.length - index - 1]
                    .messageList[snapshot.data[snapshot.data.length - index - 1]
                            .messageList.length -
                        1]
                    .message
                : "",
            //lastTime: DateFormat.yMMMd().format(snapshot.data[index].messageList[snapshot.data[index].messageList.length -1].chatTimeStamp),
          );
        },
      );
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    }
    return const CircularProgressIndicator();
  }

  Future<void> _pull() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      futureConversations = AuthenticationService().fetchConversations();
    });
  }
}
