import 'dart:convert';

City cityFromMap(String str) => City.fromMap(json.decode(str));

String cityToMap(City data) => json.encode(data.toMap());

class City {
  City({
    required this.date,
    required this.cityInfo,
  });

  final String date;
  final CityInfo cityInfo;

  factory City.fromMap(Map<String, dynamic> json) => City(
        date: json["Eklendi"],
        cityInfo: CityInfo.fromMap(json["Sehir-Bilgileri"]!),
      );

  Map<String, dynamic> toMap() => {
        "Eklendi": date,
        "Sehir-Bilgileri": cityInfo.toMap(),
      };
}

class CityInfo {
  CityInfo({
    required this.plaka,
    required this.city,
  });

  final int plaka;
  final String city;

  factory CityInfo.fromMap(Map<String, dynamic> json) => CityInfo(
        plaka: json["plaka"],
        city: json["sehir"],
      );

  Map<String, dynamic> toMap() => {
        "plaka": plaka,
        "sehir": city,
      };
}
