import 'package:flutter/material.dart';
import 'package:sign_ups/Components/rounded_button.dart';
import 'package:sign_ups/Screens/Welcome/components/welcomeBackground.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * .60),
          RoundedButton(text: "Create an Account", pressed: (){},
              color: Colors.white, textColor: Colors.black),
          RoundedButton(text: "Login", pressed: (){},
              color: Colors.black, textColor: Colors.white),
        ],
      ),
    );
  }
}



