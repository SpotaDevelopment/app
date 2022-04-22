import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_ups/Components/rounded_button.dart';
import 'package:sign_ups/Components/select_teams_list.dart';
import 'package:sign_ups/Screens/Home/home_page.dart';
import 'package:sign_ups/Screens/SelectTeams/components/background.dart';
import 'package:sign_ups/UserServices/userServices.dart';
import 'package:sign_ups/auth/AuthenticationService.dart';
import 'package:sign_ups/model/UserAccount.dart';
import 'package:sign_ups/model/leagues.dart';
import '/constants/all_constants.dart';

class Body extends StatelessWidget {
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
          SelectTeamsList(),
          RoundedButton(
            text: "Continue",
            pressed: () async {
              if (globalUserAccount == null)
                globalUserAccount = await getUserAccountByEmail(
                    FirebaseAuth.instance.currentUser?.email);
              AuthenticationService()
                  .addTeamSubscriptions(
                selectedTeams: selectedBasketballTeams,
                email: globalUserAccount.email,
              )
                  .then(
                (result) {
                  if (result == null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomePage();
                        },
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      //TODO: probably want to change the implentation of this?
                      SnackBar(
                        content: Text(
                          result,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  }
                },
              );
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) {
              //          return HomePage();
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
