import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:halisaha_app/helper/hive_services/hive_service.dart';

class TeamService {
  static final _db = FirebaseFirestore.instance;
  static addNewTeam(
      {required String name,
      required String shortName,
      required String city,
      required String town,
      required String imageUrl,
      required List<String> members}) {
    var _newDocId = _db.collection('team').doc().id;

    final team = <String, dynamic>{
      "id": _newDocId,
      "name": name,
      "city": city,
      "lastPoint": 0,
      "imageUrl": imageUrl,
      "town": town,
      "shortName": shortName,
      "members": members
    };

    _db.doc('team/$_newDocId').set(team);
  }

  static teamsToHive() async {
    _db.collection("team").snapshots().listen((event) {
      for (var doc in event.docs) {
        debugPrint("usertohive");
        HiveService.setData(
            doc.data()['id'].toString(),
            doc.data()['name'].toString(),
            doc.data()['email'].toString(),
            doc.data()['password'].toString(),
            doc.data()['profile_image'].toString(),
            doc.data()['city'].toString(),
            doc.data()['town'].toString());
      }
    });
  }
}
