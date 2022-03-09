import 'package:flutter/material.dart';
import 'package:sign_ups/Components/already_have_an_account_check.dart';
import 'package:sign_ups/Components/rounded_button.dart';
import 'package:sign_ups/Components/rounded_password_field.dart';
import 'package:sign_ups/Components/select_league.dart';
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
    var leagueNames = [
      'NFL Football',
      'NBA Basketball',
      'MLB Baseball',
      'NHL Hockey',
      'NCAA Basketball',
      'NCAA Football',
      'PGA Golf',
      'NASCAR Racing',
      'WNBA Basketball'
    ];
    var iconList = [
      Icon(Icons.sports_football_outlined, color: Colors.black),
      Icon(Icons.sports_basketball_outlined, color: Colors.black),
      Icon(Icons.sports_baseball_outlined, color: Colors.black),
      Icon(Icons.sports_hockey_outlined, color: Colors.black),
      Icon(Icons.sports_basketball_outlined, color: Colors.black),
      Icon(Icons.sports_football_outlined, color: Colors.black),
      Icon(Icons.sports_golf_outlined, color: Colors.black),
      Icon(Icons.directions_car, color: Colors.black),
      Icon(Icons.sports_basketball_outlined, color: Colors.black),
    ];
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: size.height * 0.03),
          Text(
            "Pick your favorite leagues",
            style: TextStyle(
                fontFamily: "Oxanium",
                fontWeight: FontWeight.bold,
                fontSize: 26),
          ),
          Text(
            "for updates, highlights, news, and more",
            style: TextStyle(
              fontFamily: "Oxanium",
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: size.height * 0.03),
          SizedBox(
            height: size.height * 0.6,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: 11,
              itemBuilder: (context, index) {
                if (index == 0 || index == 10) return const SizedBox.shrink();
                return SizedBox(
                  height: size.height * 0.065,
                  child: ListTile(
                    leading: iconList[index - 1],
                    title: Text(leagueNames[index - 1]),
                    tileColor: lightGrey,
                    trailing:
                        Icon(Icons.add_circle_outline, color: Colors.black),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.black,
                  thickness: 1,
                  height: 1,
                );
              },
            ),
          ),
          RoundedButton(
            //TODO: Move this down
            text: "Continue",
            pressed: () {},
            color: primaryColor,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
