import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:halisaha_app/screens/home_screen.dart';
import 'package:halisaha_app/screens/login_screen.dart';

class SplashScreenFeature {
  static final _user = FirebaseAuth.instance.currentUser;
  static goToNewPage() {
    if (_user == null) {
      return LoginScreen();
    }
    if (_user != null) {
      return HomeScreen();
    } else {
      return Scaffold(
        body:
            Center(child: Image.asset("assets/images/logo_adaptive_fore.png")),
      );
    }
  }
}
