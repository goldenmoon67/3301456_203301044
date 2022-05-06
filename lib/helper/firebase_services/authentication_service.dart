import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:halisaha_app/screens/home_screen.dart';

class AuthenticationService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static Future<void> createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      //_userCredential.user.displayName?=name!;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static loginWithEmailandPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      //_userCredential.user.displayName?=name!;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static userLog(BuildContext context) {
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        ScaffoldMessenger.of(context).showSnackBar(snackbarMessage);
      } else {
        Navigator.pushNamed(context, "/HomeScreen");
      }
    });
  }

  static final snackbarMessage = SnackBar(
    content: const Text('Hatali email veya sifre!'),
    backgroundColor: Colors.red.shade400,
  );
}
