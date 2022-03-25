import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class Game {
  final String homeTeamName;
  final String homeTeamAbrv;
  final String awayTeamName;
  final String awayTeamAbrv;
  final String date;
  final int homeTeamScore;
  final int awayTeamScore;
  final int homeTeamWins;
  final int homeTeamLosses;
  final int awayTeamWins;
  final int awayTeamLosses;
  const Game({
    required this.homeTeamName,
    required this.homeTeamAbrv,
    required this.awayTeamName,
    required this.awayTeamAbrv,
    required this.date,
    required this.homeTeamScore,
    required this.awayTeamScore,
    required this.homeTeamWins,
    required this.homeTeamLosses,
    required this.awayTeamWins,
    required this.awayTeamLosses,
  });
}

Future<List<Game>> fetchGames() async {
  var user_email = "";
  var link = "";
  if (FirebaseAuth.instance.currentUser != null) {
    user_email = FirebaseAuth.instance.currentUser!.email.toString();
    link = serverDomain + "users/getScores/" + user_email;
  } else {
    print("went into getGeneralScores");
    link = serverDomain + "users/getGeneralScores"; //no user is logged in
  }
  final response = await http.get(Uri.parse(link));
  if (response.statusCode == 200) {
    //Iterable l = json.decode(response.body);
    var jsonData = json.decode(response.body);
    //List<Game> returns =   List<Game>.from(l.map((model) => Game.fromJson(model)));

    List<Game> games = [];
    for (var g in jsonData) {
      Game game = Game(
          homeTeamName: g["homeTeamName"],
          homeTeamAbrv: g["homeTeamAbrv"],
          awayTeamName: g["awayTeamName"],
          awayTeamAbrv: g["awayTeamAbrv"],
          date: g["date"],
          homeTeamScore: g["homeTeamScore"],
          awayTeamScore: g["awayTeamScore"],
          homeTeamWins: g["homeTeamWins"],
          homeTeamLosses: g["homeTeamLosses"],
          awayTeamWins: g["awayTeamWins"],
          awayTeamLosses: g["awayTeamLosses"]);
      games.add(game);
    }
    return games;
  } else {
    print(response.body);
    throw Exception('Failed to load games');
  }
}
