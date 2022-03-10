import 'package:flutter/material.dart';
import 'package:sign_ups/Components/already_have_an_account_check.dart';
import 'package:sign_ups/Components/birthday_picker.dart';
import 'package:sign_ups/Components/rounded_button.dart';
import 'package:sign_ups/Components/rounded_input_field.dart';
import 'package:sign_ups/Components/rounded_password_field.dart';
import 'package:sign_ups/Screens/Login/login_screen.dart';
import 'package:sign_ups/Screens/SelectTeams/select_teams_screen.dart';
import 'package:sign_ups/Screens/SignUpContinue/components/signUpContinueBackground.dart';
import 'package:sign_ups/Components/skip_and_back_button.dart';
import 'package:sign_ups/Screens/SignUp/signup_screen.dart';
import 'package:sign_ups/auth/AuthenticationService.dart';

class Body extends StatelessWidget {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final String email;
  final String username;

  Body({
    Key? key,
    required this.email,
    required this.username,
  }) : super(key: key);

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
              controller: firstNameController,
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
              controller: lastNameController,
              hintText: "Your Last Name",
              icon: Icons.person,
              onChanged: (value) {},
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
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
              text: "Create an Account",
              pressed: () {
                AuthenticationService()
                    .signUp(
                  email: email,
                  username: username,
                  firstName: firstNameController.text.trim(),
                  lastName: lastNameController.text.trim(),
                  birthday: birthdayController.text.trim(),
                )
                    .then((result) {
                  if (result == null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SelectTeams();
                        },
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      //TODO: probably want to change the implentation of this?
                      SnackBar(
                        content: Text(
                          result,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  }
                });
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
