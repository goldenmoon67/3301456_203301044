import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static Future<void> createUser(String email, String password) async {
    try {
      var _userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      //_userCredential.user.displayName?=name!;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static loginWithEmailandPassword(String email, String password) async {
    try {
      var _userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      debugPrint(_userCredential.user.toString());

      //_userCredential.user.displayName?=name!;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static userLog() {
    late bool result = false;
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        result = false;
      } else {
        result = true;
      }
    });
    return result;
  }
}
