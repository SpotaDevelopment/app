import 'package:flutter/material.dart';
import 'package:sign_ups/Components/already_have_an_account_check.dart';
import 'package:sign_ups/Components/rounded_button.dart';
import 'package:sign_ups/Components/rounded_input_field.dart';
import 'package:sign_ups/Components/skip_and_back_button.dart';
import 'package:sign_ups/Screens/Login/login_screen.dart';
import 'package:sign_ups/Screens/SignUp/signup_screen.dart';
import 'package:sign_ups/Screens/ForgotInfo/components/ForgotInfoBackground.dart';

class Body extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; //This size provides us total height and width of our screen
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: size.height * 0.05,
          ),
          SkipButton(backScreen: SignUpScreen(), skipScreen: SignUpScreen()),
          SizedBox(
            height: size.height * 0.2,
          ),
          Text(
            "No worries, \n We wouldn't forget about you",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Oxanium",
              fontWeight: FontWeight.normal,
              fontSize: 27,
            ),
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
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
            controller: emailController,
            hintText: "Your Email",
            onChanged: (value) {},
            icon: Icons.email,
          ),
          SizedBox(
            height: size.height * 0.2,
          ),
          RoundedButton(
            //TODO: Move this down
            text: "Send email",
            pressed: () {},
            color: Colors.black,
            textColor: Colors.white,
          ),
          AlreadyHaveAnAccountCheck(
              login: true,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}
