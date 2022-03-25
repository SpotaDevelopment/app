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

  Game copyWith({
    String? homeTeamName,
    String? homeTeamAbrv,
    String? awayTeamName,
    String? awayTeamAbrv,
    String? date,
    int? homeTeamScore,
    int? awayTeamScore,
    int? homeTeamWins,
    int? homeTeamLosses,
    int? awayTeamWins,
    int? awayTeamLosses,
  }) {
    return Game(
      homeTeamName: homeTeamName ?? this.homeTeamName,
      homeTeamAbrv: homeTeamAbrv ?? this.homeTeamAbrv,
      awayTeamName: awayTeamName ?? this.awayTeamName,
      awayTeamAbrv: awayTeamAbrv ?? this.awayTeamAbrv,
      date: date ?? this.date,
      homeTeamScore: homeTeamScore ?? this.homeTeamScore,
      awayTeamScore: awayTeamScore ?? this.awayTeamScore,
      homeTeamWins: homeTeamWins ?? this.homeTeamWins,
      homeTeamLosses: homeTeamLosses ?? this.homeTeamLosses,
      awayTeamWins: awayTeamWins ?? this.awayTeamWins,
      awayTeamLosses: awayTeamLosses ?? this.awayTeamLosses,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'homeTeamName': homeTeamName,
      'homeTeamAbrv': homeTeamAbrv,
      'awayTeamName': awayTeamName,
      'awayTeamAbrv': awayTeamAbrv,
      'date': date,
      'homeTeamScore': homeTeamScore,
      'awayTeamScore': awayTeamScore,
      'homeTeamWins': homeTeamWins,
      'homeTeamLosses': homeTeamLosses,
      'awayTeamWins': awayTeamWins,
      'awayTeamLosses': awayTeamLosses,
    };
  }

  factory Game.fromMap(Map<String, dynamic> map) {
    return Game(
      homeTeamName: map['homeTeamName'] ?? '',
      homeTeamAbrv: map['homeTeamAbrv'] ?? '',
      awayTeamName: map['awayTeamName'] ?? '',
      awayTeamAbrv: map['awayTeamAbrv'] ?? '',
      date: map['date'] ?? '',
      homeTeamScore: map['homeTeamScore']?.toInt() ?? 0,
      awayTeamScore: map['awayTeamScore']?.toInt() ?? 0,
      homeTeamWins: map['homeTeamWins']?.toInt() ?? 0,
      homeTeamLosses: map['homeTeamLosses']?.toInt() ?? 0,
      awayTeamWins: map['awayTeamWins']?.toInt() ?? 0,
      awayTeamLosses: map['awayTeamLosses']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Game.fromJson(String a) => Game.fromMap(json.decode(a));

  @override
  String toString() {
    return 'Game(homeTeamName: $homeTeamName, homeTeamAbrv: $homeTeamAbrv, awayTeamName: $awayTeamName, awayTeamAbrv: $awayTeamAbrv, date: $date, homeTeamScore: $homeTeamScore, awayTeamScore: $awayTeamScore, homeTeamWins: $homeTeamWins, homeTeamLosses: $homeTeamLosses, awayTeamWins: $awayTeamWins, awayTeamLosses: $awayTeamLosses)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Game &&
        other.homeTeamName == homeTeamName &&
        other.homeTeamAbrv == homeTeamAbrv &&
        other.awayTeamName == awayTeamName &&
        other.awayTeamAbrv == awayTeamAbrv &&
        other.date == date &&
        other.homeTeamScore == homeTeamScore &&
        other.awayTeamScore == awayTeamScore &&
        other.homeTeamWins == homeTeamWins &&
        other.homeTeamLosses == homeTeamLosses &&
        other.awayTeamWins == awayTeamWins &&
        other.awayTeamLosses == awayTeamLosses;
  }

  @override
  int get hashCode {
    return homeTeamName.hashCode ^
        homeTeamAbrv.hashCode ^
        awayTeamName.hashCode ^
        awayTeamAbrv.hashCode ^
        date.hashCode ^
        homeTeamScore.hashCode ^
        awayTeamScore.hashCode ^
        homeTeamWins.hashCode ^
        homeTeamLosses.hashCode ^
        awayTeamWins.hashCode ^
        awayTeamLosses.hashCode;
  }
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
