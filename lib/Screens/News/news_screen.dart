import 'package:flutter/material.dart';
import 'package:sign_ups/Components/leagues_toggle_buttons.dart';
import 'package:sign_ups/Components/news_article_with_image.dart';
import 'package:sign_ups/Components/spota_appbar.dart';
import 'package:sign_ups/constants.dart';
import '../../Components/bottom_navigation_bar.dart';
import '../../Components/news_article_without_image.dart';

class SportsNewsPage extends StatelessWidget{
  static const String path = 'lib/Screens/News/news_screen.dart';

  SportsNewsPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SpotaAppBar(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: LeaguesToggleButtons(),
          ),
          Divider(
            color: Colors.black),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: <Widget>[
                NewsArticleWithImage(
                  title: "Spota is a sick app baby!",
                  date: "3/7/22 1:32 PM",
                  source: "Basketball",
                  newsImage: "assets/images/SpotaLogo.jpeg",
                  pressed: () {  },
                ),
                NewsArticleWithoutImage(
                  title: "Spota is a dope (even without images) app baby!",
                  date: "3/7/22 1:34 PM",
                  source: "Basketball",
                  pressed: () {  },
                ),
                NewsArticleWithImage(
                  title: "Thank you for scrolling",
                  date: "3/7/22 1:35 PM",
                  source: "Basketball",
                  newsImage: "assets/images/SpotaLogo.jpeg",
                  pressed: () {  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

