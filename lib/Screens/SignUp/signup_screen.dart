import 'package:flutter/material.dart';
import 'package:sign_ups/Components/skip_and_back_button.dart';
import 'package:sign_ups/Screens/SignUp/components/body.dart';
import 'package:sign_ups/Screens/Welcome/welcome_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
          SkipButton(backScreen: WelcomeScreen(), skipScreen: SignUpScreen()),
        ],
      ),
      // resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }
}
