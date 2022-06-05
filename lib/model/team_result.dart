import 'dart:convert';

TeamResult teamResultFromMap(String str) =>
    TeamResult.fromMap(json.decode(str));

String teamResultToMap(TeamResult data) => json.encode(data.toMap());

class TeamResult {
  TeamResult({
    required this.takim,
    required this.p,
  });

  final String takim;

  final String p;

  factory TeamResult.fromMap(Map<String, dynamic> json) => TeamResult(
        takim: json["takim"],
        p: json["p"],
      );

  Map<String, dynamic> toMap() => {
        "takim": takim,
        "p": p,
      };
}
