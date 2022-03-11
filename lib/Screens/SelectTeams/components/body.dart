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
            leagueAndTeams: [
              {
                'league': 'NBA Basketball',
                'IconsAndTeams': [
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/76ers.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': '76ers',
                  },
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/bucks.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': 'Bucks',
                  },
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/bulls.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': 'Bulls',
                  },
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/cavaliers.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': 'Cavaliers',
                  },
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/celtics.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': 'Celtics',
                  },
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/clippers.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': 'Clippers',
                  },
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/grizzlies.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': 'Grizzlies',
                  },
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/hawks.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': 'Hawks',
                  },
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/heat.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': 'Heat',
                  },
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/hornets.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': 'Hornets',
                  },
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/jazz.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': 'Jazz',
                  },
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/kings.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': 'Kings',
                  },
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/knicks.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': 'Knicks',
                  },
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/lakers.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': 'Lakers',
                  },
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/magic.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': 'Magic',
                  },
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/mavericks.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': 'Mavericks',
                  },
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/nets.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': 'Nets',
                  },
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/nuggets.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': 'Nuggets',
                  },
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/pacers.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': 'Pacers',
                  },
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/pelicans.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': 'Pelicans',
                  },
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/pistons.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': 'Pistons',
                  },
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/raptors.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': 'Raptors',
                  },
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/rockets.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': 'Rockets',
                  },
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/spurs.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': 'Spurs',
                  },
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/suns.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': 'Suns',
                  },
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/thunder.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': 'Thunder',
                  },
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/timberwolves.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': 'Timberwolves',
                  },
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/trailBlazers.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': 'Trail Blazers',
                  },
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/warriors.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': 'Warriors',
                  },
                  {
                    'icon': Image.asset(
                      "assets/icons/NBA/wizards.png",
                      color: null,
                      height: 35,
                      width: 35,
                    ),
                    'team': 'Wizards',
                  },
                ],
              },
            ],
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
