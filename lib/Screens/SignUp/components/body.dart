import 'package:flutter/material.dart';
import 'package:sign_ups/Components/rounded_input_field.dart';
import 'package:sign_ups/Components/rounded_password_field.dart';
import 'package:sign_ups/Screens/SignUp/components/signUpBackground.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Let the Games Begin",
            style: TextStyle(
              fontFamily: "Oxanium",
              fontWeight: FontWeight.normal,
              fontSize: 30,
            ),
          ),
          SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Spacer(flex: 1),
            Text(
              "Username",
              style: TextStyle(
                  fontFamily: "Oxanium",
                  fontWeight: FontWeight.bold), //TODO: change this font
            ),
            Spacer(flex: 5),
          ]),
          RoundedInputField(
            hintText: "Your Username",
            icon: Icons.person,
            onChanged: (value) {},
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            //TODO:Figure out how to shift this to the right to match figma
            Spacer(flex: 1),
            Text(
              "Password",
              style: TextStyle(
                fontFamily: "Oxanium",
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(flex: 5)
          ]),
          RoundedPasswordField(),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            //TODO:Figure out how to shift this to the right to match figma
            SizedBox(width: 52),
            Text(
              "Confirm Password",
              style: TextStyle(
                fontFamily: "Oxanium",
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(flex: 5)
          ]),
          RoundedPasswordField(),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            //TODO:Figure out how to shift this to the right to match figma
            Spacer(flex: 1),
            Text(
              "Email",
              style: TextStyle(
                fontFamily: "Oxanium",
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(flex: 5)
          ]),
          RoundedInputField(
            hintText: "Your Email",
            onChanged: (value) {},
            icon: Icons.email,
          ),
          SizedBox(height: size.height * .05),
        ],
      ),
    );
  }
}
