import 'package:flutter/material.dart';
import 'package:sign_ups/Screens/Welcome/welcome_screen.dart';
import 'package:sign_ups/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sign Ups',
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
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
