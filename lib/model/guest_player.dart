
import 'package:meta/meta.dart';
import 'dart:convert';

GuestPlayer guestPlayerFromMap(String str) => GuestPlayer.fromMap(json.decode(str));

String guestPlayerToMap(GuestPlayer data) => json.encode(data.toMap());

class GuestPlayer {
  GuestPlayer({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory GuestPlayer.fromMap(Map<String, dynamic> json) => GuestPlayer(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
  };
}
