import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sign_ups/Screens/Chat/in_chat.dart';
import 'package:sign_ups/auth/AuthenticationService.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

import 'package:sign_ups/Screens/Home/home_screen.dart';
import 'package:sign_ups/Screens/Welcome/welcome_screen.dart';

import '/constants/all_constants.dart';
import 'Screens/Home/home_page.dart';
import 'firebase_options.dart';
import 'model/Chat/chat_message.dart';

//StreamController<List<String>> streamController = StreamController();
StreamController<List<Message>> streamController2 =
    StreamController<List<Message>>.broadcast(
  onListen: () {
    print("listening");
    print(listMessages);
  },
  onCancel: () {
    print("Cancelled");
    print(listMessages);
  },
);
// StreamController<List<Message>> controller =
//     StreamController<List<Message>>.broadcast();
//Map<Conversation,List<Chat<Messages>>>
//String destination = "/topic/messages";
//String message_destination = "/ws/message";
var _listMessage = <String>[];
var listMessages = <Message>[];
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<
    NavigatorState>(); //allows for navigating anywhere without context
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

void onConnect(StompFrame frame) {
  print("connected");
  print(FirebaseAuth.instance.currentUser!.displayName!);
  stompClient.subscribe(
    destination: '/user/' +
        FirebaseAuth.instance.currentUser!.displayName! +
        '/messages',
    callback: (frame) {
      print("callback: received a message");
      //Map<String, dynamic> result = json.decode(frame.body!);
      Message? result2 = Message.fromJson(frame.body!);
      //print(frame);
      //display a dialog popup once the user receives a call back anywhere in the app

      //receive Message from topic
      //InChatPage.conversation.messageList!.add(result2);
      // _listMessage.add(result['content']);
      listMessages.add(result2);
      //Observe list message
      //streamController.sink.add(_listMessage);
      //receive Message from ws
      //if payload received is user added to group chat then add to list
      streamController2.sink.add(listMessages);
    },
  );
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
}

final stompClient = StompClient(
  config: StompConfig.SockJS(
    url: ws_url,
    onConnect: onConnect,
    beforeConnect: () async {
      print('waiting to connect...');
      await Future.delayed(const Duration(milliseconds: 200));
      print('connecting...');
    },
    onWebSocketError: (dynamic error) => print(error.toString()),
    stompConnectHeaders: {'Connection': 'upgrade', 'Upgrade': 'websocket'},
    webSocketConnectHeaders: {'Connection': 'upgrade', 'Upgrade': 'websocket'},
  ),
);

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription<User?> user;
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        stompClient.activate(); //activate the stomp client connection
        //streamController.add(_listMessage); //Observe list message changes
        streamController2.add(listMessages); //Observe list message changes
      }
    });
  }

  @override
  void dispose() {
    user.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: FirebaseAuth.instance.currentUser == null
          ? WelcomeScreen.id
          : HomeScreen.id,
      debugShowCheckedModeBanner: false,
      title: 'Spota',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        HomePage.id: (context) => HomePage(),
      },
      home: WelcomeScreen(),
      navigatorKey: navigatorKey,
    );
  }
}
