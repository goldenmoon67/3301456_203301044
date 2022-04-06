
import 'dart:convert';

UserPlayer userPlayerFromMap(String str) => UserPlayer.fromMap(json.decode(str));

String userPlayerToMap(UserPlayer data) => json.encode(data.toMap());

class UserPlayer {
  UserPlayer({
    required this.playerId,
    required this.name,
    required this.photo,
    required this.teams,
    required this.email,
    required this.password,
    required this.foot,
    required this.position,
  });

  final int playerId;
  final String name;
  final String photo;
  final List<int> teams;
  final String email;
  final int password;
  final bool foot;
  final Position position;

  factory UserPlayer.fromMap(Map<String, dynamic> json) => UserPlayer(
    playerId: json["player_id"],
    name: json["name"],
    photo: json["photo"],
    teams: List<int>.from(json["teams"].map((x) => x)),
    email: json["email"],
    password: json["password"],
    foot: json["foot"],
    position: Position.fromMap(json["position"]),
  );

  Map<String, dynamic> toMap() => {
    "player_id": playerId,
    "name": name,
    "photo": photo,
    "teams": List<dynamic>.from(teams.map((x) => x)),
    "email": email,
    "password": password,
    "foot": foot,
    "position": position.toMap(),
  };
}

class Position {
  Position({
    required this.goalkeaper,
    required this.defendar,
    required this.midfielder,
    required this.forward,
  });

  final bool goalkeaper;
  final bool defendar;
  final bool midfielder;
  final bool forward;

  factory Position.fromMap(Map<String, dynamic> json) => Position(
    goalkeaper: json["goalkeaper"],
    defendar: json["defendar"],
    midfielder: json["midfielder"],
    forward: json["forward"],
  );

  Map<String, dynamic> toMap() => {
    "goalkeaper": goalkeaper,
    "defendar": defendar,
    "midfielder": midfielder,
    "forward": forward,
  };
}
