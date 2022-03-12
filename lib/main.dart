import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sign_ups/Screens/Home/home_screen.dart';
import 'Screens/Home/home_page.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:sign_ups/Screens/Welcome/welcome_screen.dart';
import 'package:sign_ups/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

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
    );
  }

  AppBar headerBar() {
    return AppBar(
      title: Text('Spota',
          style: TextStyle(
            fontFamily: "Oxanium",
            fontSize: 30,
          )),
      backgroundColor: Color(0xffff7a22),
      actions: const <Widget>[
        Icon(
          Icons.menu,
          color: Colors.white,
          size: 24.0,
        )
      ],
    );
  }
}
