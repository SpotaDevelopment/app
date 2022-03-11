import 'package:flutter/material.dart';
import 'package:sign_ups/Components/ScoreCards/Basketball/final_basketball_score_card.dart';
import 'package:sign_ups/Components/leagues_toggle_buttons.dart';
import 'package:sign_ups/Components/news_article_with_image.dart';
import 'package:sign_ups/Components/spota_appbar.dart';
import 'package:sign_ups/constants.dart';
import '../../Components/ScoreCards/Basketball/future_basketball_score_card.dart';
import '../../Components/ScoreCards/Basketball/live_basketball_score_card.dart';
import '../../Components/bottom_navigation_bar.dart';
import '../../Components/news_article_without_image.dart';
import '../../model/Game.dart';

class SportsScoresPage extends StatefulWidget {
  static const String path = 'lib/Screens/Scores/scores_screen.dart';
  SportsScoresPage({Key? key}) : super(key: key);

  @override
  _SportsScoresPageState createState() => _SportsScoresPageState();
}

class _SportsScoresPageState extends State<SportsScoresPage> {
  late Future<List<Game>> futureGames;

  @override
  void initState() {
    super.initState();
    //futureGames = fetchGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SpotaAppBar(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: LeaguesToggleButtons(),
          ),
          const Divider(color: Colors.black),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: const <Widget>[
                FinalBasketballScoreCard(
                    homeTeam: "PHX",
                    homeRecord: "51-13",
                    homeScore: "111",
                    awayTeam: "BOS",
                    awayRecord: "39-27",
                    awayScore: "90",
                    date: "12/10/21"),
                FinalBasketballScoreCard(
                    homeTeam: "DEN",
                    homeRecord: "39-26",
                    homeScore: "131",
                    awayTeam: "GSW",
                    awayRecord: "43-22",
                    awayScore: "124",
                    date: "Yesterday"),
                LiveBasketballScoreCard(
                    homeTeam: "OKC",
                    homeRecord: "20-44",
                    homeScore: "61",
                    awayTeam: "MIL",
                    awayRecord: "40-25",
                    awayScore: "68",
                    period: "Q2",
                    time: "2:21"),
                LiveBasketballScoreCard(
                    homeTeam: "MEM",
                    homeRecord: "44-22",
                    homeScore: "77",
                    awayTeam: "NOP",
                    awayRecord: "27-37",
                    awayScore: "58",
                    period: "Halftime"),
                FutureBasketballScoreCard(
                  homeTeam: "MIA",
                  homeRecord: "52-13",
                  awayTeam: "PHX",
                  awayRecord: "44-22",
                  date: "Tomorrow",
                  time: "5:30 PM",
                ),
                FutureBasketballScoreCard(
                  homeTeam: "BOS",
                  homeRecord: "39-27",
                  awayTeam: "DET",
                  awayRecord: "18-47",
                  date: "3/11/22",
                  time: "5:30 PM",
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
