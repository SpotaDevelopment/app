import 'package:flutter/material.dart';
import 'package:sign_ups/Screens/Login/components/body.dart';
import 'package:sign_ups/Screens/Welcome/welcome_screen.dart';

import '../../Components/skip_and_back_button.dart';
import '../Home/home_page.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0,
        actions: <Widget>[
          SkipButton(
              backScreen: const WelcomeScreen(), skipScreen: const HomePage()),
        ],
      ),
      body: Body(),
    );
  }
}
