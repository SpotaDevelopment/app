import 'package:flutter/material.dart';
import 'package:sign_ups/Components/already_have_an_account_check.dart';
import 'package:sign_ups/Components/rounded_button.dart';
import 'package:sign_ups/Components/rounded_password_field.dart';
import 'package:sign_ups/Screens/ForgotInfo/forgot_info_screen.dart';
import 'package:sign_ups/Screens/Home/home_screen.dart';
import 'package:sign_ups/Screens/SelectTeams/components/background.dart';
import 'package:sign_ups/Screens/SignUp/signup_screen.dart';
import 'package:sign_ups/auth/AuthenticationService.dart';
import 'package:sign_ups/constants.dart';

import '../../../Components/rounded_input_field.dart';

class Body extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
              height: size.height * 0.03), //TODO: USE SizedBox() instead of
          Text(
            "Pick your favorite leagues",
            style: TextStyle(
                fontFamily: "Oxanium",
                fontWeight: FontWeight.normal,
                fontSize: 26),
          ),
          Text(
            "for updates, highlights, news, and more",
            style: TextStyle(
              fontFamily: "Oxanium",
              fontWeight: FontWeight.normal,
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: size.height * 0.07,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 2,
                      color: Colors.black,
                    ),
                    bottom: BorderSide(
                      width: 2,
                      color: Colors.black,
                    ),
                  ),
                  color: lightGrey,
                ),
              ),
              Positioned(
                child: Container(
                  height: size.height * 0.07,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 2,
                        color: Colors.black,
                      ),
                      bottom: BorderSide(
                        width: 2,
                        color: Colors.black,
                      ),
                    ),
                    color: lightGrey,
                  ),
                ),
                right: 0,
                left: 0,
                bottom: -50,
              ),
              Positioned(
                child: Container(
                  height: size.height * 0.07,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 2,
                        color: Colors.black,
                      ),
                      bottom: BorderSide(
                        width: 2,
                        color: Colors.black,
                      ),
                    ),
                    color: lightGrey,
                  ),
                ),
                right: 0,
                left: 0,
                bottom: -100,
              ),
              Positioned(
                child: Container(
                  height: size.height * 0.07,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 2,
                        color: Colors.black,
                      ),
                      bottom: BorderSide(
                        width: 2,
                        color: Colors.black,
                      ),
                    ),
                    color: lightGrey,
                  ),
                ),
                right: 0,
                left: 0,
                bottom: -150,
              ),
              Positioned(
                child: Container(
                  height: size.height * 0.07,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 2,
                        color: Colors.black,
                      ),
                      bottom: BorderSide(
                        width: 2,
                        color: Colors.black,
                      ),
                    ),
                    color: lightGrey,
                  ),
                ),
                right: 0,
                left: 0,
                bottom: -200,
              ),
              Positioned(
                child: Container(
                  height: size.height * 0.07,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        width: 2,
                        color: Colors.black,
                      ),
                      bottom: BorderSide(
                        width: 2,
                        color: Colors.black,
                      ),
                    ),
                    color: lightGrey,
                  ),
                ),
                right: 0,
                left: 0,
                bottom: -250,
              ),
            ],
          ),

          Spacer(flex: 2),
          RoundedButton(
            //TODO: Move this down
            text: "Login",
            pressed: () {
              AuthenticationService()
                  .signIn(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim())
                  .then((result) {
                if (result == null) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
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
              login: true,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen(); //TODO: Change this to redirect to the choose teams page once its setup
                    },
                  ),
                );
              }),
          Spacer(flex: 1)
        ],
      ),
    );
  }
}
