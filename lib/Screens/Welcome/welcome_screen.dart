import 'package:flutter/material.dart';
import 'package:sign_ups/Screens/Home/home_page.dart';
import 'package:sign_ups/Screens/SignUp/signup_screen.dart';
import 'package:sign_ups/Screens/Welcome/components/body.dart';

import '../../Components/skip_and_back_button.dart';

class WelcomeScreen extends StatelessWidget {
  static var id = 'welcome';

  const WelcomeScreen({Key? key}) : super(key: key);

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
            skipScreen: HomePage(),
            backScreen: null,
          ),
        ],
      ),
      body: Body(),
    );
  }
}
