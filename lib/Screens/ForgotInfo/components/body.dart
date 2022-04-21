import 'package:flutter/material.dart';
import 'package:sign_ups/Components/already_have_an_account_check.dart';
import 'package:sign_ups/Components/rounded_button.dart';
import 'package:sign_ups/Components/rounded_input_field.dart';
import 'package:sign_ups/Components/skip_and_back_button.dart';
import 'package:sign_ups/Screens/Login/login_screen.dart';
import 'package:sign_ups/Screens/SignUp/signup_screen.dart';
import 'package:sign_ups/Screens/ForgotInfo/components/ForgotInfoBackground.dart';

import '../../../auth/AuthenticationService.dart';

class Body extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context)
        .size; //This size provides us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: SizedBox(
        height: size.height,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: (size.height * .32), bottom: 15),
                child: const Text(
                  "No worries, \n We wouldn't forget about you",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Oxanium",
                    fontWeight: FontWeight.normal,
                    fontSize: 27,
                  ),
                ),
              ),
              Row(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: (size.width * .1), top: 32),
                  child: Text(
                    "Email",
                    style: TextStyle(
                      fontFamily: "Oxanium",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]),
              RoundedInputField(
                controller: emailController,
                hintText: "Your Email",
                onChanged: (value) {},
                icon: Icons.email,
              ),

              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RoundedButton(
                    //TODO: Move this down
                    text: "Send Email",
                    pressed: () {
                      AuthenticationService()
                          .passwordReset(email: emailController.text.trim())
                          .then((result) {
                        if (result == null) {
                          showAlertDialog(context);
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
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: (size.height * .05)),
                child: AlreadyHaveAnAccountCheck(
                    login: true,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const SignUpScreen();
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

showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const LoginScreen();
          },
        ),
      );
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Notice"),
    content: Text(
      "An email has just been sent to you, Click the link provided to complete password reset",
      style: TextStyle(fontSize: 20),
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
