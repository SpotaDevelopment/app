import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_ups/Components/already_have_an_account_check.dart';
import 'package:sign_ups/Components/rounded_button.dart';
import 'package:sign_ups/Components/rounded_password_field.dart';
import 'package:sign_ups/Components/skip_and_back_button.dart';
import 'package:sign_ups/Components/text_field_container.dart';
import 'package:sign_ups/Screens/ForgotInfo/forgot_info_screen.dart';
import 'package:sign_ups/Screens/Home/home_page.dart';

import 'package:sign_ups/Screens/Home/home_screen.dart';
import 'package:sign_ups/Screens/Login/components/background.dart';
import 'package:sign_ups/Screens/News/news_screen.dart';
import 'package:sign_ups/Screens/SignUp/signup_screen.dart';
import 'package:sign_ups/UserServices/userServices.dart';
import 'package:sign_ups/auth/AuthenticationService.dart';
import 'package:sign_ups/model/UserAccount.dart';

import '../../../Components/rounded_input_field.dart';

class Body extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Body({
    Key? key,
    email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: (size.height * .3), bottom: 15),
            child: Text(
              "Welcome Back",
              style: TextStyle(
                  fontFamily: "Oxanium",
                  fontWeight: FontWeight.normal,
                  fontSize: 30),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: (size.width * .1)),
              child: Text(
                "Email",
                style: TextStyle(
                    fontFamily: "Oxanium", fontWeight: FontWeight.bold),
              ),
            ),
          ]),
          RoundedInputField(
            controller: emailController,
            hintText: "Your Email",
            onChanged: (value) {},
            icon: Icons.person,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: (size.width * .1)),
              child: Text(
                "Password",
                style: TextStyle(
                    fontFamily: "Oxanium", fontWeight: FontWeight.bold),
              ),
            ),
          ]),
          RoundedPasswordField(
            controller: passwordController,
            // onChanged: (value) {},
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ForgotInfoScreen(); //TODO: Change this to redirect to the choose teams page once its setup
                  },
                ),
              );
            }, //TODO: Add in the transition to forgot username/password page
            child: Text(
              "Forgot Username or Password?",
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RoundedButton(
                text: "Login",
                pressed: () {
                  AuthenticationService()
                      .signIn(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim())
                      .then((result) {
                    if (result == null) {
                      globalUserAccount =
                          getUserAccountByEmail(emailController.text.trim());
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    } else {
                      // Handling error display
                      ScaffoldMessenger.of(context).showSnackBar(
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
                        return SignUpScreen(); //TODO: Change this to redirect to the choose teams page once its setup
                      },
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
