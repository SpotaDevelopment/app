import 'package:http/http.dart' as http;
class Game {
  String homeTeamName;
  String awayTeamName;
  String homeTeamAbrv;
  String awayTeamAbrv;
  String date;
  int homeTeamScore;
  int awayTeamScore;
  int homeTeamWins;
  int homeTeamLosses;
  int awayTeamWins;
  int awayTeamLosses;

  Game(
      {required this.homeTeamName,
      required this.awayTeamName,
      required this.homeTeamAbrv,
      required this.awayTeamAbrv,
      required this.date,
      required this.homeTeamScore,
      required this.awayTeamScore,
      required this.homeTeamWins,
      required this.homeTeamLosses,
      required this.awayTeamWins,
      required this.awayTeamLosses});

  Map toJson() => {
        'homeTeamName': homeTeamName,
        'awayTeamName': awayTeamName,
        'homeTeamAbrv': homeTeamAbrv,
        'awayTeamAbrv': awayTeamAbrv,
        'date': date,
        'homeTeamScore': homeTeamScore,
        'awayTeamScore': awayTeamScore,
        'homeTeamWins': homeTeamWins,
        'homeTeamLosses': homeTeamLosses,
        'awayTeamWins': awayTeamWins,
        'awayTeamLosses': awayTeamLosses
      };
      
}


