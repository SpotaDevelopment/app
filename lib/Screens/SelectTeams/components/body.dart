import 'package:flutter/material.dart';
import 'package:sign_ups/Components/already_have_an_account_check.dart';
import 'package:sign_ups/Components/rounded_button.dart';
import 'package:sign_ups/Components/rounded_password_field.dart';
import 'package:sign_ups/Components/select_leagues_list.dart';
import 'package:sign_ups/Components/select_teams_list.dart';
import 'package:sign_ups/Screens/ForgotInfo/forgot_info_screen.dart';
import 'package:sign_ups/Screens/Home/home_screen.dart';
import 'package:sign_ups/Screens/SelectLeagues/components/background.dart';
import 'package:sign_ups/Screens/SignUp/signup_screen.dart';
import 'package:sign_ups/auth/AuthenticationService.dart';
import 'package:sign_ups/constants.dart';
import 'package:sign_ups/model/leagues.dart';

import '../../../Components/rounded_input_field.dart';

class Body extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final String path = "assets/icons/NBA";
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
          SizedBox(height: size.height * 0.03),
          Text(
            "Pick your favorite teams",
            style: TextStyle(
                fontFamily: "Oxanium",
                fontWeight: FontWeight.bold,
                fontSize: 26),
          ),
          Text(
            "from each of your favorite leagues",
            style: TextStyle(
              fontFamily: "Oxanium",
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: size.height * 0.03),
          SelectTeamsList(
            leagueAndTeams: leagueAndTeams,
          ),
          RoundedButton(
            //TODO: Move this down
            text: "Continue",
            pressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return SelectLeagues();
              //     },
              //   ),
              // );
            },
            color: primaryColor,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
