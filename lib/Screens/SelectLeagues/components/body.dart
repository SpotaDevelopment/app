import 'package:flutter/material.dart';
import 'package:sign_ups/Components/rounded_button.dart';
import 'package:sign_ups/Components/select_leagues_list.dart';
import 'package:sign_ups/Screens/SelectLeagues/components/background.dart';
import 'package:sign_ups/Screens/SelectTeams/select_teams_screen.dart';
import 'package:sign_ups/model/leagues.dart';
import '/constants/all_constants.dart';


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
          SelectLeaguesList(),
          RoundedButton(
            //TODO: Move this down
            text: "Continue",
            pressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    colorToggleIndices = [];
                    iconToggleIndices = [];
                    selectedBasketballTeams = [];
                    for (int i = 0; i < basketballIconsAndTeams.length; i++) {
                      colorToggleIndices.add(0);
                      iconToggleIndices.add(0);
                    }
                    return SelectTeams();
                  },
                ),
              );
            },
            color: primaryColor,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
