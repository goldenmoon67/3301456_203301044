import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:halisaha_app/helper/firebase_services/authentication_service.dart';
import 'package:halisaha_app/screens/home_screen.dart';
import 'package:halisaha_app/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  var _user = FirebaseAuth.instance.currentUser;
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    // debugPrint(user!.email.toString());
    if (widget._user == null) {
      return LoginScreen();
    }
    if (widget._user != null) {
      return const HomeScreen();
    } else {
      return const CircularProgressIndicator(
        backgroundColor: Colors.blue,
        color: Colors.amber,
      );
    }
  }
}
