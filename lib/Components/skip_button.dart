import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sign_ups/Screens/SignUp/signup_screen.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.95,
      child: Align(
        alignment: Alignment.topRight,
        child: Text.rich(
          TextSpan(
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontFamily: "Oxanium",
            ),
            children: [
              TextSpan(
                text: 'Skip',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpScreen(); //TODO: Change this to redirect to the choose teams page once its setup
                        },
                      ),
                    );
                  },
              ),
              WidgetSpan(
                child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                  icon: Icon(Icons.chevron_right_rounded),
                  color: Colors.white,
                  onPressed: () {
                    print("fuck");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
