import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:halisaha_app/screens/helper_secreens/detail_screens/player_detail_screen.dart';
import 'package:halisaha_app/screens/helper_secreens/detail_screens/team_detail_screen.dart';
import 'package:halisaha_app/screens/helper_secreens/events_screens/find_match_for_single_player.dart';
import 'package:halisaha_app/screens/helper_secreens/events_screens/find_player_screen.dart';
import 'package:halisaha_app/screens/helper_secreens/events_screens/find_rival_screen.dart';
import 'package:halisaha_app/screens/helper_secreens/events_screens/find_stadium_screen.dart';
import 'package:halisaha_app/screens/helper_secreens/my_info_screens/edit_profile_screen.dart';
import 'package:halisaha_app/screens/helper_secreens/my_info_screens/my_features_screen.dart';
import 'package:halisaha_app/screens/helper_secreens/my_info_screens/my_matches_screen.dart';
import 'package:halisaha_app/screens/helper_secreens/my_info_screens/my_teams_screen.dart';
import 'package:halisaha_app/screens/main_screens/dashboard_screen.dart';
import 'package:halisaha_app/screens/main_screens/login_screen.dart';
import 'package:halisaha_app/screens/main_screens/register_screen.dart';

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
        return createRoute(const LoginScreen());
      case "/DashBoardScreen":
        return createRoute(const DashBoardScreen());
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
    return null;
  }
}
