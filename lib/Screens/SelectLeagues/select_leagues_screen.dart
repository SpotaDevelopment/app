import 'package:flutter/material.dart';
import 'package:sign_ups/Screens/Home/home_page.dart';
import 'package:sign_ups/Screens/SelectLeagues/components/body.dart';
import 'package:sign_ups/Screens/SignUpContinue/signup_screen_continue.dart';
import '../Home/home_screen.dart';
import '/constants/all_constants.dart';

class SelectLeagues extends StatelessWidget {
  const SelectLeagues({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        leadingWidth: 100,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SignUpContinue(email: "", username: ""); //Todo: the sign up continue page requires these parameters but they are not in this page
                },
              ),
            );
          },
          child: Row(
            children: [
              Icon(
                Icons.chevron_left_rounded,
                color: Colors.white,
              ),
              Text(
                "Back",
                style: TextStyle(
                  fontFamily: "Oxanium",
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        title: Text(
          "Spota",
          style: TextStyle(
            fontFamily: "Oxanium",
            fontWeight: FontWeight.normal,
            fontSize: 30,
          ),
        ),
        actions: [
          Container(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomePage(); //Todo: the sign up continue page requires these parameters but they are not in this page
                    },
                  ),
                );
              },
              child: Row(
                children: [
                  Text(
                    "Skip",
                    style: TextStyle(
                      fontFamily: "Oxanium",
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: Body(),
    );
  }
}
