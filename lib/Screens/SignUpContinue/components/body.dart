import 'package:flutter/material.dart';
import 'package:sign_ups/Components/already_have_an_account_check.dart';
import 'package:sign_ups/Components/birthday_picker.dart';
import 'package:sign_ups/Components/rounded_button.dart';
import 'package:sign_ups/Components/rounded_input_field.dart';
import 'package:sign_ups/Components/rounded_password_field.dart';
import 'package:sign_ups/Screens/Home/home_page.dart';
import 'package:sign_ups/Screens/Login/login_screen.dart';
import 'package:sign_ups/Screens/SelectLeagues/select_leagues_screen.dart';
import 'package:sign_ups/Screens/SelectTeams/select_teams_screen.dart';
import 'package:sign_ups/Screens/SignUpContinue/components/signUpContinueBackground.dart';
import 'package:sign_ups/Components/skip_and_back_button.dart';
import 'package:sign_ups/Screens/SignUp/signup_screen.dart';
import 'package:sign_ups/auth/AuthenticationService.dart';
import 'package:sign_ups/model/UserAccount.dart';

import '../../../HelperFunctions/functions.dart';

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
        child: SizedBox(
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: (size.height * .27), bottom: 15),
                child: const Text(
                  "Let the Games Begin",
                  style: TextStyle(
                    fontFamily: "Oxanium",
                    fontWeight: FontWeight.normal,
                    fontSize: 30,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: (size.width * .1)),
                    child: const Text(
                      "First Name",
                      style: TextStyle(
                          fontFamily: "Oxanium",
                          fontWeight: FontWeight.bold), //TODO: change this font
                    ),
                  ),
                ],
              ),
              RoundedInputField(
                controller: firstNameController,
                hintText: "First Name",
                icon: Icons.person,
                onChanged: (value) {},
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: (size.width * .1)),
                    child: const Text(
                      "Last Name",
                      style: TextStyle(
                        fontFamily: "Oxanium",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              RoundedInputField(
                controller: lastNameController,
                hintText: "Last Name",
                icon: Icons.person,
                onChanged: (value) {},
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: (size.width * .1)),
                    child: const Text(
                      "Birthday (optional)",
                      style: TextStyle(
                        fontFamily: "Oxanium",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const BirthdayPicker(),
              //const SizedBox(height: 100),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RoundedButton(
                    text: "Customize Account",
                    pressed: () {
                      userAccount = new UserAccount(
                        username: username,
                        email: email,
                        firstName: firstNameController.text.trim(),
                        lastName: lastNameController.text.trim(),
                        birthday: birthdayController.text.trim(),
                        profilePicColor: getRandColorString(),
                      );
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) {
                      //       return SelectLeagues();
                      //     },
                      //   ),
                      // );
                      AuthenticationService()
                          .signUp(userAccount: userAccount)
                          .then(
                        (result) {
                          if (result == null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SelectLeagues();
                                },
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              //TODO: probably want to change the implentation of this?
                              SnackBar(
                                content: Text(
                                  result,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            );
                          }
                        },
                      );
                    },
                    color: Colors.black,
                    textColor: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: (size.height * .05)),
                child: AlreadyHaveAnAccountCheck(
                    login: false,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const LoginScreen(); //TODO: Change this to redirect to the choose teams page once its setup
                          },
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
