import 'package:flutter/material.dart';
import 'package:sign_ups/Components/already_have_an_account_check.dart';
import 'package:sign_ups/Components/birthday_picker.dart';
import 'package:sign_ups/Components/rounded_button.dart';
import 'package:sign_ups/Components/rounded_input_field.dart';
import 'package:sign_ups/Components/rounded_password_field.dart';
import 'package:sign_ups/Screens/Login/login_screen.dart';
import 'package:sign_ups/Screens/SelectLeagues/select_leagues_screen.dart';
import 'package:sign_ups/Screens/SignUpContinue/components/signUpContinueBackground.dart';
import 'package:sign_ups/Components/skip_and_back_button.dart';
import 'package:sign_ups/Screens/SignUp/signup_screen.dart';

class Body extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.1),
            SkipButton(backScreen: SignUpScreen(), skipScreen: SignUpScreen()),
            SizedBox(height: size.height * 0.15),
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
                "First Name",
                style: TextStyle(
                    fontFamily: "Oxanium",
                    fontWeight: FontWeight.bold), //TODO: change this font
              ),
              Spacer(flex: 5),
            ]),
            RoundedInputField(
              controller: usernameController,
              hintText: "Your First Name",
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
            RoundedInputField(
              controller: usernameController,
              hintText: "Your Last Name",
              icon: Icons.person,
              onChanged: (value) {},
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
              //TODO:Figure out how to shift this to the right to match figma
              Spacer(flex: 1),
              Text(
                "Birthday (optional)",
                style: TextStyle(
                  fontFamily: "Oxanium",
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(flex: 5)
            ]),
            BirthdayPicker(),
            SizedBox(height: 100),
            RoundedButton(
              //TODO: Move this down
              text: "Create an Account",
              pressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SelectLeagues();
                    },
                  ),
                );
              },
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
