import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:halisaha_app/model/team_result.dart';

class FetchTeamResult {
  static late List<TeamResult> teamResult;
  static Future<List<TeamResult>> readFromJson(BuildContext context) async {
    String readAsString = await DefaultAssetBundle.of(context)
        .loadString('assets/data/teamsResult.json');

    var jsonObject = jsonDecode(readAsString);
    List<TeamResult> teamInfos = (jsonObject as List)
        .map((resultMap) => TeamResult.fromMap(resultMap))
        .toList();
    return teamInfos;
  }
}
