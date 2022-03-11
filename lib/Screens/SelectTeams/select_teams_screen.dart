import 'package:flutter/material.dart';
import 'package:sign_ups/Screens/SelectTeams/components/body.dart';
import 'package:sign_ups/Screens/SignUpContinue/signup_screen_continue.dart';
import '../../constants.dart';

class SelectTeams extends StatelessWidget {
  const SelectTeams({Key? key}) : super(key: key);

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
                  return SignUpContinue();
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
                      return SignUpContinue(); //TODO: Change this to redirect to the choose teams page once its setup
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
