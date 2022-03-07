import 'package:flutter/material.dart';
import 'package:sign_ups/Components/spota_appbar.dart';
import 'package:sign_ups/constants.dart';

import '../../Components/bottom_navigation_bar.dart';

class SportsNewsPage extends StatelessWidget{
  static const String path = 'lib/Screens/News/news_screen.dart';

  SportsNewsPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: SpotaAppBar(),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 32, 16),
        children: <Widget>[
          ToggleButtons(
            fillColor: primaryColor,
            hoverColor: primaryColor,
            color: secondaryColor,
            selectedColor: Colors.white,
            borderColor: Colors.grey.shade300,
            renderBorder: true,
            highlightColor: secondaryColor,
            children: <Widget>[
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[
                      Text("Top News"),
                    ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Text("NBA"),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Text("NFL"),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Text("MLB"),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Text("NHL"),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Text("NCAAF"),
                  ],
                ),
              ),
            ],
            onPressed: (int index) {},
            isSelected: [true, false, false, false,
            false, false],
          ),
      ],
      ),
      bottomNavigationBar: BottomNavBar()
    );
  }
}

