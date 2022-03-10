import 'package:flutter/material.dart';
import 'package:sign_ups/Screens/SignUpContinue/components/Body.dart';

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
      // resizeToAvoidBottomInset: false,
      body: Body(email: email, username: username),
    );
  }
}
