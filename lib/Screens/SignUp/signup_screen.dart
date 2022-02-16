import 'package:flutter/material.dart';
import 'package:sign_ups/Screens/SignUp/components/body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }
}
