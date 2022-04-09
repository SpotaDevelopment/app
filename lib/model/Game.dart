import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
class Game {
  String? homeTeamName;
  String? awayTeamName;
  String? homeTeamAbrv;
  String? awayTeamAbrv;
  String? date;
  int? homeTeamScore;
  int? awayTeamScore;
  int? homeTeamWins;
  int? homeTeamLosses;
  int? awayTeamWins;
  int? awayTeamLosses;

  Game(
      {this.homeTeamName,
      this.awayTeamName,
      this.homeTeamAbrv,
      this.awayTeamAbrv,
      this.date,
      this.homeTeamScore,
      this.awayTeamScore,
      this.homeTeamWins,
      this.homeTeamLosses,
      this.awayTeamWins,
      this.awayTeamLosses});

  Game.fromJson(Map<String, dynamic> json) {
    homeTeamName = json['homeTeamName'];
    awayTeamName = json['awayTeamName'];
    homeTeamAbrv = json['homeTeamAbrv'];
    awayTeamAbrv = json['awayTeamAbrv'];
    date = json['date'];
    homeTeamScore = json['homeTeamScore'];
    awayTeamScore = json['awayTeamScore'];
    homeTeamWins = json['homeTeamWins'];
    homeTeamLosses = json['homeTeamLosses'];
    awayTeamWins = json['awayTeamWins'];
    awayTeamLosses = json['awayTeamLosses'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['homeTeamName'] = this.homeTeamName;
    data['awayTeamName'] = this.awayTeamName;
    data['homeTeamAbrv'] = this.homeTeamAbrv;
    data['awayTeamAbrv'] = this.awayTeamAbrv;
    data['date'] = this.date;
    data['homeTeamScore'] = this.homeTeamScore;
    data['awayTeamScore'] = this.awayTeamScore;
    data['homeTeamWins'] = this.homeTeamWins;
    data['homeTeamLosses'] = this.homeTeamLosses;
    data['awayTeamWins'] = this.awayTeamWins;
    data['awayTeamLosses'] = this.awayTeamLosses;
    return data;
  }
}