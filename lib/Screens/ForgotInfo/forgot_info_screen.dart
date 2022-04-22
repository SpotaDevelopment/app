import 'package:flutter/material.dart';
import 'package:sign_ups/Screens/ForgotInfo/components/body.dart';
import 'package:sign_ups/Screens/Login/login_screen.dart';

import '../../Components/skip_and_back_button.dart';
import '../Home/home_page.dart';
import '../Welcome/welcome_screen.dart';

class ForgotInfoScreen extends StatelessWidget {
  const ForgotInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0,
        actions: <Widget>[
          SkipButton(backScreen: LoginScreen(), skipScreen: HomePage()),
        ],
      ),
      // resizeToAvoidBottomInset: false,
      body: Body(),
    );
  }
}
