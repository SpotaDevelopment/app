import 'package:flutter/material.dart';
import 'package:sign_ups/Components/already_have_an_account_check.dart';
import 'package:sign_ups/Components/rounded_button.dart';
import 'package:sign_ups/Components/rounded_input_field.dart';
import 'package:sign_ups/Components/rounded_password_field.dart';
import 'package:sign_ups/Components/skip_and_back_button.dart';
import 'package:sign_ups/Screens/Login/login_screen.dart';
import 'package:sign_ups/Screens/SignUp/components/signUpBackground.dart';
import 'package:sign_ups/Screens/SignUp/signup_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.07),
            SkipButton(backScreen: null, skipScreen: SignUpScreen()),
            SizedBox(height: size.height * 0.05),
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
            SizedBox(height: 100),
            RoundedButton(
              //TODO: Move this down
              text: "LOGIN",
              pressed: () {},
              color: Colors.black,
              textColor: Colors.white,
            ),
            AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen(); //TODO: Change this to redirect to the choose teams page once its setup
                      },
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
