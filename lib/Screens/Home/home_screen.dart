import 'package:flutter/material.dart';
import 'package:sign_ups/Screens/Welcome/welcome_screen.dart';
import 'package:sign_ups/auth/AuthenticationService.dart';

class HomeScreen extends StatefulWidget {
  static var id = 'home';

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        child: Text("Logout"),
        onPressed: () {
          AuthenticationService().signOut().then((_) =>
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen())));
        },
      ),
    ));
  }
}
