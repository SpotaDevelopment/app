import 'package:flutter/material.dart';
import 'package:sign_ups/Screens/SignUpContinue/components/body.dart';

class SignUpContinue extends StatelessWidget {
  const SignUpContinue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }
}
