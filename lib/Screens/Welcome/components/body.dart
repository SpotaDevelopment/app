import 'package:flutter/material.dart';
import 'package:sign_ups/Components/rounded_button.dart';
import 'package:sign_ups/Screens/Login/login_screen.dart';
import 'package:sign_ups/Screens/SignUp/signup_screen.dart';
import 'package:sign_ups/Screens/Welcome/components/welcomeBackground.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; //This size provides us total height and width of our screen
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * .60),
          RoundedButton(
              text: "Create an Account",
              pressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen(); //TODO: Change this to redirect to the choose teams page once its setup
                    },
                  ),
                );
              }, //TODO: Add in Create an Account function transition
              color: Colors.white,
              textColor: Colors.black),
          RoundedButton(
              text: "Login",
              pressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              }, //TODO: Add in Login function transition
              color: Colors.black,
              textColor: Colors.white),
        ],
      ),
    );
  }
}
