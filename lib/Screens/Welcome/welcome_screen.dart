import 'package:flutter/material.dart';
import 'package:sign_ups/Screens/Welcome/components/body.dart';

class WelcomeScreen extends StatelessWidget {
  static var id = 'welcome';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Body(),
    );
  }
}
