import 'package:meta/meta.dart';
import 'dart:convert';

Match matchFromMap(String str) => Match.fromMap(json.decode(str));

String matchToMap(Match data) => json.encode(data.toMap());

class Match {
  Match({
    required this.matchId,
    required this.rivals,
    required this.win,
    required this.lost,
  });

  final int matchId;
  final List<int> rivals;
  final int win;
  final int lost;

  factory Match.fromMap(Map<String, dynamic> json) => Match(
    matchId: json["match_id"],
    rivals: List<int>.from(json["rivals"].map((x) => x)),
    win: json["win"],
    lost: json["lost"],
  );

  Map<String, dynamic> toMap() => {
    "match_id": matchId,
    "rivals": List<dynamic>.from(rivals.map((x) => x)),
    "win": win,
    "lost": lost,
  };
}
