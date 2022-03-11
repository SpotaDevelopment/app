import 'package:flutter/material.dart';
import 'package:sign_ups/Components/leagues_toggle_buttons.dart';
import 'package:sign_ups/Components/news_article_with_image.dart';
import 'package:sign_ups/Components/spota_appbar.dart';
import 'package:sign_ups/constants.dart';
import '../../Components/ScoreCards/Basketball/final_basketball_score_card.dart';
import '../../Components/ScoreCards/Basketball/future_basketball_score_card.dart';
import '../../Components/ScoreCards/Basketball/live_basketball_score_card.dart';
import '../../Components/bottom_navigation_bar.dart';
import '../../Components/news_article_without_image.dart';

class HomePage extends StatelessWidget{
  static const String path = 'lib/Screens/News/news_screen.dart';

  const HomePage({Key? key}) : super(key: key);

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
          const Divider(
              color: Colors.black),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                NewsArticleWithImage(
                  title: "Spota is a sick app baby!",
                  date: "3/9/22 1:32 PM",
                  source: "NBC Sports",
                  newsImage: "assets/images/suns.jpg",
                  pressed: () {  },
                ),
                const FinalBasketballScoreCard(homeTeam: "DEN",
                    homeRecord: "39-26", homeScore: "131", awayTeam: "GSW",
                    awayRecord: "43-22", awayScore: "124", date: "Yesterday"),
                const LiveBasketballScoreCard(homeTeam: "OKC",
                    homeRecord: "20-44", homeScore: "61", awayTeam: "MIL",
                    awayRecord: "40-25", awayScore: "68", period: "Q2", time: "2:21"),
                NewsArticleWithoutImage(
                  title: "Spota is way cooler than our app!",
                  date: "3/9/22 1:34 PM",
                  source: "ESPN",
                  pressed: () {  },
                ),
                NewsArticleWithImage(
                  title: "Devin Booker to Make Suns Return Tonight in Miami",
                  date: "3/9/22 1:35 PM",
                  source: "Sports Illustrated",
                  newsImage: "assets/images/suns.jpg",
                  pressed: () {  },
                ),
                const FutureBasketballScoreCard(homeTeam: "MIA",
                  homeRecord: "52-13", awayTeam: "PHX",
                  awayRecord: "44-22", date: "Tonight", time: "5:30 PM",),
                const FutureBasketballScoreCard(homeTeam: "BOS",
                  homeRecord: "39-27", awayTeam: "DET",
                  awayRecord: "18-47", date: "3/11/22", time: "5:30 PM",),
                NewsArticleWithImage(
                  title: "Chris Paul Hopeful to Return for the Playoffs",
                  date: "3/9/22 1:05 PM",
                  source: "ESPN",
                  newsImage: "assets/images/suns.jpg",
                  pressed: () {  },
                ),
                NewsArticleWithoutImage(
                  title: "Spota, The Only Thing In Phoenix Hotter than the Suns!",
                  date: "3/9/22 1:03 PM",
                  source: "AZ Central",
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

