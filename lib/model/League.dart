import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'Team.dart';

class League {
  String name;
  String acronym;
  List<Team> teams;
  League({
    required this.name,
    required this.acronym,
    required this.teams,
  });

  League copyWith({
    String? name,
    String? acronym,
    List<Team>? teams,
  }) {
    return League(
      name: name ?? this.name,
      acronym: acronym ?? this.acronym,
      teams: teams ?? this.teams,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'acronym': acronym,
      'teams': teams.map((x) => x.toMap()).toList(),
    };
  }

  factory League.fromMap(Map<String, dynamic> map) {
    return League(
      name: map['name'] ?? '',
      acronym: map['acronym'] ?? '',
      teams: List<Team>.from(map['teams']?.map((x) => Team.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory League.fromJson(String source) => League.fromMap(json.decode(source));

  @override
  String toString() => 'League(name: $name, acronym: $acronym, teams: $teams)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is League &&
      other.name == name &&
      other.acronym == acronym &&
      listEquals(other.teams, teams);
  }

  @override
  int get hashCode => name.hashCode ^ acronym.hashCode ^ teams.hashCode;
}
