import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_ups/Components/already_have_an_account_check.dart';
import 'package:sign_ups/Components/rounded_button.dart';
import 'package:sign_ups/Components/rounded_password_field.dart';
import 'package:sign_ups/Components/text_field_container.dart';
import 'package:sign_ups/Screens/Home/home_screen.dart';
import 'package:sign_ups/Screens/Login/components/background.dart';
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
          // SizedBox(height:size.height*0.03), //TODO: USE SizedBox() instead of Spacer()
          Spacer(flex: 10),
          Text(
            "Welcome Back",
            style: TextStyle(
                fontFamily: "Oxanium",
                fontWeight: FontWeight.normal,
                fontSize: 30),
          ),
          Spacer(),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Spacer(flex: 1),
            Text(
              "Email",
              style:
                  TextStyle(fontFamily: "Oxanium", fontWeight: FontWeight.bold),
            ),
            Spacer(flex: 5),
          ]),
          RoundedInputField(
            controller: emailController,
            hintText: "Your Email",
            onChanged: (value) {},
            icon: Icons.person,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            //TODO:Figure out how to shift this to the right to match figma
            Spacer(),
            Text(
              "Password",
              style:
                  TextStyle(fontFamily: "Oxanium", fontWeight: FontWeight.bold),
            ),
            Spacer(flex: 5)
          ]),
          RoundedPasswordField(
            controller: passwordController,
            // onChanged: (value) {},
          ),
          GestureDetector(
            onTap:
                () {}, //TODO: Add in the transition to forgot username/password page
            child: Text(
              "Forgot Username or Password?",
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          Spacer(flex: 7),
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
                  ScaffoldMessenger.of(context).showSnackBar( //TODO: probably want to change the implentation of this?
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
