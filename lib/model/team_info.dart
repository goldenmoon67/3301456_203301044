import 'dart:convert';

Team teamFromMap(String str) => Team.fromMap(json.decode(str));

String teamToMap(Team data) => json.encode(data.toMap());

class Team {
  Team({
    required this.teamId,
    required this.name,
    required this.captain,
    required this.shortName,
    required this.photo,
    required this.members,
    required this.pastMatches,
  });

  final int teamId;
  final String name;
  final int captain;
  final String shortName;
  final String photo;
  final List<int> members;
  final List<int> pastMatches;

  factory Team.fromMap(Map<String, dynamic> json) => Team(
    teamId: json["team_id"],
    name: json["name"],
    captain: json["captain"],
    shortName: json["short_name"],
    photo: json["photo"],
    members: List<int>.from(json["members"].map((x) => x)),
    pastMatches: List<int>.from(json["past_matches"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "team_id": teamId,
    "name": name,
    "captain": captain,
    "short_name": shortName,
    "photo": photo,
    "members": List<dynamic>.from(members.map((x) => x)),
    "past_matches": List<dynamic>.from(pastMatches.map((x) => x)),
  };
}
