import 'package:flutter/material.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback
      press; //TODO: Not really sure what VoidCallback does here, but i had to do it to get line 18 (onTap:press) to work.... from: https://stackoverflow.com/questions/64484113/the-argument-type-function-cant-be-assigned-to-the-parameter-type-void-funct

  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text(login ? "Don't have an Account? " : "Already have an Account? "),
      GestureDetector(
        onTap: press,
        child: Text(login ? "Sign Up" : "Sign In",
            style: TextStyle(
              // color: primaryColor, //TODO: Change this color
              fontWeight: FontWeight.bold,
            )),
      )
    ]);
  }
}
