import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:halisaha_app/helper/hive_services/hive_service.dart';
import 'package:halisaha_app/screens/main_screens/dashboard_screen.dart';
import 'package:halisaha_app/screens/main_screens/login_screen.dart';

class SplashScreenFeature {
  static final _user = FirebaseAuth.instance.currentUser;
  static goToNewPage() {
    if (HiveService.resultUser() == false) {
      return LoginScreen();
    }
    if (HiveService.resultUser() == true) {
      return DashBoardScreen();
    } else {
      return Scaffold(
        body:
            Center(child: Image.asset("assets/images/logo_adaptive_fore.png")),
      );
    }
  }
}
