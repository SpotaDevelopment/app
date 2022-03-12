import 'package:flutter/material.dart';
import 'package:sign_ups/Components/already_have_an_account_check.dart';
import 'package:sign_ups/Components/rounded_button.dart';
import 'package:sign_ups/Components/rounded_input_field.dart';
import 'package:sign_ups/Components/rounded_password_field.dart';
import 'package:sign_ups/Screens/Home/home_screen.dart';
import 'package:sign_ups/Screens/Login/login_screen.dart';
import 'package:sign_ups/Screens/SignUp/components/signUpBackground.dart';
import 'package:sign_ups/Screens/SignUpContinue/signup_screen_continue.dart';
import 'package:sign_ups/auth/AuthenticationService.dart';
import 'package:sign_ups/Components/skip_and_back_button.dart';
import 'package:sign_ups/Screens/SignUp/signup_screen.dart';

class Body extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordCheckController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: (size.height * .23), bottom: 10),
                child: Text(
                  "Let the Games Begin",
                  style: TextStyle(
                    fontFamily: "Oxanium",
                    fontWeight: FontWeight.normal,
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: (size.width * .1)),
                    child: Text(
                      "Username",
                      style: TextStyle(
                          fontFamily: "Oxanium",
                          fontWeight: FontWeight.bold), //TODO: change this font
                    ),
                  ),
                  Spacer(),
                ],
              ),
              RoundedInputField(
                controller: usernameController,
                hintText: "Your Username",
                icon: Icons.person,
                onChanged: (value) {},
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: (size.width * .1)),
                    child: Text(
                      "Password",
                      style: TextStyle(
                        fontFamily: "Oxanium",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              RoundedPasswordField(
                controller: passwordController,
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: (size.width * .1)),
                    child: Text(
                      "Confirm Password",
                      style: TextStyle(
                        fontFamily: "Oxanium",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              RoundedPasswordField(
                controller: passwordCheckController,
              ),
              Row(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: (size.width * .1)),
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
                    text: "Continue",
                    pressed: () {
                      //!When the button is pressed, it calls the authentication service to sign the user up
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) {
                      //       return SignUpContinue(email: "", username: "");
                      //     },
                      //   ),
                      // );
                      AuthenticationService()
                          .createUserWithEmailAndPassword(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                              passwordCheck:
                                  passwordCheckController.text.trim(),
                              username: usernameController.text.trim())
                          .then(
                        (result) {
                          if (result == null) {
                            // Navigator.pushReplacement(context,
                            //   MaterialPageRoute(builder: (context) => HomeScreen()));
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SignUpContinue(
                                      email: emailController.text.trim(),
                                      username: usernameController.text.trim());
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
                        },
                      );
                    },
                    color: Colors.black,
                    textColor: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: (size.height * .025)),
                child: AlreadyHaveAnAccountCheck(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
