import 'dart:convert';
import 'dart:ui';

import 'League.dart';
import 'SeasonData.dart';
import 'Team.dart';

class Athlete {
  int athleteID;
  String firstName;
  String lastName;
  //Image athletePhoto;
  Team currentTeam;
  League currentLeague;
  Athlete({
    required this.athleteID,
    required this.firstName,
    required this.lastName,
    required this.currentTeam,
    required this.currentLeague,
  });
  //List<SeasonData> playerData;

  Athlete copyWith({
    int? athleteID,
    String? firstName,
    String? lastName,
    Team? currentTeam,
    League? currentLeague,
  }) {
    return Athlete(
      athleteID: athleteID ?? this.athleteID,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      currentTeam: currentTeam ?? this.currentTeam,
      currentLeague: currentLeague ?? this.currentLeague,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'athleteID': athleteID,
      'firstName': firstName,
      'lastName': lastName,
      'currentTeam': currentTeam.toMap(),
      'currentLeague': currentLeague.toMap(),
    };
  }

  factory Athlete.fromMap(Map<String, dynamic> map) {
    return Athlete(
      athleteID: map['athleteID']?.toInt() ?? 0,
      firstName: map['firstName'] ?? '',
      lastName: map['lastName'] ?? '',
      currentTeam: Team.fromMap(map['currentTeam']),
      currentLeague: League.fromMap(map['currentLeague']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Athlete.fromJson(String source) =>
      Athlete.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Athlete(athleteID: $athleteID, firstName: $firstName, lastName: $lastName, currentTeam: $currentTeam, currentLeague: $currentLeague)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Athlete &&
        other.athleteID == athleteID &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.currentTeam == currentTeam &&
        other.currentLeague == currentLeague;
  }

  @override
  int get hashCode {
    return athleteID.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        currentTeam.hashCode ^
        currentLeague.hashCode;
  }
}
