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
          Stack(
            clipBehavior: Clip.none,
            children: [
              SelectLeague(
                icon: Icon(Icons.sports_football_outlined),
                league: "NFL Football",
                isFirstLeague: true,
              ),
              SelectLeague(
                icon: Icon(Icons.sports_basketball_outlined),
                league: "NBA Basketball",
                isFirstLeague: false,
                index: 1,
              ),
              SelectLeague(
                icon: Icon(Icons.sports_baseball_outlined),
                league: "MLB Baseball",
                isFirstLeague: false,
                index: 2,
              ),
              SelectLeague(
                icon: Icon(Icons.sports_hockey_outlined),
                league: "NHL Hockey",
                isFirstLeague: false,
                index: 3,
              ),
              SelectLeague(
                icon: Icon(Icons.sports_basketball_outlined),
                league: "NCAA Basketball",
                isFirstLeague: false,
                index: 4,
              ),
              SelectLeague(
                icon: Icon(Icons.sports_football_outlined),
                league: "NCAA Football",
                isFirstLeague: false,
                index: 5,
              ),
              SelectLeague(
                icon: Icon(Icons.sports_golf_outlined),
                league: "PGA Golf",
                isFirstLeague: false,
                index: 6,
              ),
              SelectLeague(
                icon: Icon(Icons.directions_car),
                league: "NASCAR Racing",
                isFirstLeague: false,
                index: 7,
              ),
              SelectLeague(
                icon: Icon(Icons.sports_basketball_outlined),
                league: "WNBA Basketball",
                isFirstLeague: false,
                index: 8,
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.5,
          ),
          RoundedButton(
            //TODO: Move this down
            text: "Continue",
            pressed: () {},
            color: primaryColor,
            textColor: Colors.white,
          ),
          Spacer(flex: 1)
        ],
      ),
    );
  }
}
