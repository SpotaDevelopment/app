import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_ups/Components/ScoreCards/Basketball/final_basketball_score_card.dart';
import 'package:sign_ups/Components/leagues_toggle_buttons.dart';
import 'package:sign_ups/Components/news_article_with_image.dart';
import 'package:sign_ups/Components/spota_appbar.dart';
import 'package:sign_ups/constants.dart';
import '../../Components/ScoreCards/Basketball/future_basketball_score_card.dart';
import '../../Components/ScoreCards/Basketball/live_basketball_score_card.dart';
import '../../Components/bottom_navigation_bar.dart';
import '../../Components/menu_drawer.dart';
import '../../Components/news_article_without_image.dart';
import '../../model/Game.dart';
import '../../auth/AuthenticationService.dart';

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
    futureGames = AuthenticationService().fetchGames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SpotaAppBar(),
      endDrawer: MenuDrawer(),
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder(
          future: futureGames,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return RefreshIndicator(
                child: _gameView(snapshot), onRefresh: _pull);
          },
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _gameView(AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      return ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (BuildContext context, int index) {
          var data = snapshot.data[index];
          // //var now = DateTime.now();
          // //if(now.isAfter(snapshot.data[index].date)) //future game
          // //{

          // //}
          return FinalBasketballScoreCard(
            homeTeam: data.homeTeamAbrv,
            homeScore: data.homeTeamScore.toString(),
            homeRecord: "${data.homeTeamWins}-${data.homeTeamLosses}",
            homeLogo:
                data.homeTeamName.toString().toLowerCase().replaceAll(' ', ''),
            awayTeam: data.awayTeamAbrv,
            awayScore: data.awayTeamScore.toString(),
            awayRecord: "${data.awayTeamWins}-${data.awayTeamLosses}",
            awayLogo:
                data.awayTeamName.toString().toLowerCase().replaceAll(' ', ''),
            date: data.date.toString().replaceAll(' 00:00:00',
                ''), //added replaceAll here to remove the time part of the date
          );
        },
      );
    } else if (snapshot.hasError) {
      return Text('${snapshot.error}');
    }
    return const CircularProgressIndicator();
  }

  Future<void> _pull() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      futureGames = AuthenticationService().fetchGames();
    });
  }
}
