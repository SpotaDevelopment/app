import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sign_ups/Screens/SignUp/signup_screen.dart';

class SkipButton extends StatelessWidget {
  var backScreen;
  var skipScreen;

  SkipButton({Key? key, required this.backScreen, required this.skipScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: size.width*.95,
        child: Row(
          children: [
            if (backScreen != null)
              Align(
                alignment: Alignment.topLeft,
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: "Oxanium",
                    ),
                    children: [
                      WidgetSpan(
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: BoxConstraints(),
                          icon: Icon(Icons.chevron_left_rounded),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return backScreen; //TODO: Change this to redirect to the choose teams page once its setup
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      TextSpan(
                        text: 'Back',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return backScreen;
                                },
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            Spacer(),
            if (skipScreen != null)
              Align(
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
                                  return skipScreen; //TODO: Change this to redirect to the choose teams page once its setup
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return skipScreen; //TODO: Change this to redirect to the choose teams page once its setup
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
