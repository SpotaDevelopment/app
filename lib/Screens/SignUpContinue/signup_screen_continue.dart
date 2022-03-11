import 'package:flutter/material.dart';
import 'package:sign_ups/Components/select_league.dart';
import 'package:sign_ups/Screens/Home/home_page.dart';
import 'package:sign_ups/Screens/SignUpContinue/components/Body.dart';

import '../../Components/skip_and_back_button.dart';
import '../SignUp/signup_screen.dart';

class SignUpContinue extends StatelessWidget {
  final String email;
  final String username;

  const SignUpContinue({
    Key? key,
    required this.email,
    required this.username,
  }) : super(key: key);

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
        SkipButton(backScreen: const SignUpScreen(), skipScreen: const HomePage()),
      ],
    ),
      body: Body(email: email, username: username),
    );
  }
}
