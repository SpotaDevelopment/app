import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'News.dart';

class NewsResult {
  String teamName;
  List<News> newsList;
  NewsResult({
    required this.teamName,
    required this.newsList,
  });

  NewsResult copyWith({
    String? teamName,
    List<News>? newsList,
  }) {
    return NewsResult(
      teamName: teamName ?? this.teamName,
      newsList: newsList ?? this.newsList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'teamName': teamName,
      'newsList': newsList.map((x) => x.toMap()).toList(),
    };
  }

  factory NewsResult.fromMap(Map<String, dynamic> map) {
    return NewsResult(
      teamName: map['teamName'] ?? '',
      newsList: List<News>.from(map['newsList']?.map((x) => News.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory NewsResult.fromJson(String source) => NewsResult.fromMap(json.decode(source));

  @override
  String toString() => 'NewsResult(teamName: $teamName, newsList: $newsList)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is NewsResult &&
      other.teamName == teamName &&
      listEquals(other.newsList, newsList);
  }

  @override
  int get hashCode => teamName.hashCode ^ newsList.hashCode;
}
