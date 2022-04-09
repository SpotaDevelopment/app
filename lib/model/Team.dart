import 'dart:convert';
import 'dart:ui';

class Team {
  String teamName;
  String teamLeague;
  String teamLogo; //this is located in assets folder in client app
  String teamAbrv;
  String record;
  Team({
    required this.teamName,
    required this.teamLeague,
    required this.teamLogo,
    required this.teamAbrv,
    required this.record,
  });

  Team copyWith({
    String? teamName,
    String? teamLeague,
    String? teamLogo,
    String? teamAbrv,
    String? record,
  }) {
    return Team(
      teamName: teamName ?? this.teamName,
      teamLeague: teamLeague ?? this.teamLeague,
      teamLogo: teamLogo ?? this.teamLogo,
      teamAbrv: teamAbrv ?? this.teamAbrv,
      record: record ?? this.record,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'teamName': teamName,
      'teamLeague': teamLeague,
      'teamLogo': teamLogo,
      'teamAbrv': teamAbrv,
      'record': record,
    };
  }

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      teamName: map['teamName'] ?? '',
      teamLeague: map['teamLeague'] ?? '',
      teamLogo: map['teamLogo'] ?? '',
      teamAbrv: map['teamAbrv'] ?? '',
      record: map['record'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Team.fromJson(String source) => Team.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Team(teamName: $teamName, teamLeague: $teamLeague, teamLogo: $teamLogo, teamAbrv: $teamAbrv, record: $record)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Team &&
      other.teamName == teamName &&
      other.teamLeague == teamLeague &&
      other.teamLogo == teamLogo &&
      other.teamAbrv == teamAbrv &&
      other.record == record;
  }

  @override
  int get hashCode {
    return teamName.hashCode ^
      teamLeague.hashCode ^
      teamLogo.hashCode ^
      teamAbrv.hashCode ^
      record.hashCode;
  }
}
