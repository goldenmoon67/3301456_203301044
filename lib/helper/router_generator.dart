import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:halisaha_app/screens/find_match_for_single_player.dart';
import 'package:halisaha_app/screens/find_rival_screen.dart';
import 'package:halisaha_app/screens/find_player_screen.dart';
import 'package:halisaha_app/screens/find_stadium_screen.dart';
import 'package:halisaha_app/screens/home_screen.dart';
import 'package:halisaha_app/screens/login_screen.dart';
import 'package:halisaha_app/screens/edit_profile_screen.dart';
import 'package:halisaha_app/screens/my_features_screen.dart';
import 'package:halisaha_app/screens/my_matches_screen.dart';
import 'package:halisaha_app/screens/my_teams_screen.dart';
import 'package:halisaha_app/screens/player_detail_screen.dart';
import 'package:halisaha_app/screens/register_screen.dart';
import 'package:halisaha_app/screens/team_detail_screen.dart';

class RouteGenerator {
  static Route<dynamic>? createRoute(Widget screenToGo) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return MaterialPageRoute(builder: (context) => screenToGo);
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPageRoute(builder: (context) => screenToGo);
    } else {
      return CupertinoPageRoute(builder: (context) => screenToGo);
    }
  }

  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case "/LoginScreen":
        return createRoute(LoginScreen());
      case "/HomeScreen":
        return createRoute(const HomeScreen());
      case "/EditProfile":
        return createRoute(const EditProfilePage());
      case "/TeamDetailScreen":
        return createRoute(const TeamDetailScreen());
      case "/FindRivalScreen":
        return createRoute(const FindRivalScreen());
      case "/FindStadium":
        return createRoute(const FindStadium());
      case "/FindPlayer":
        return createRoute(const FindPlayerScreen());
      case "/MyTeamsScreen":
        return createRoute(const MyTeamsScreen());
      case "/FindMatchSinglePlayerScreen":
        return createRoute(const FindMatchSinglePlayerScreen());
      case "/MyFeaturesScreen":
        return createRoute(const MyFeaturesScreen());
      case "/MyMatchesScreen":
        return createRoute(const MyMatchesScreen());
      case "/RegisterScreen":
        return createRoute(const RegisterScreen());
      case "/PlayerDetailScreen":
        return createRoute(const PlayerDetailScreen());
    }
    
  }
}
