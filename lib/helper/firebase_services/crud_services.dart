import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:halisaha_app/helper/hive_services/hive_service.dart';
import 'package:halisaha_app/model/users.dart';

class CrudServices {
  static final _db = FirebaseFirestore.instance;

  static addNewUser(
      {required String name,
      required String email,
      required String password,
      required String city,
      required String town}) {
    var _newDocId = _db.collection('users').doc().id;

    final user = <String, dynamic>{
      "name": name,
      "email": email,
      "id": _newDocId,
      "password": password,
      "city": city,
      "town": town
    };

    _db.doc('users/$_newDocId').set(user);
  }

  static usersFirebaseToHive() async {
    var _usersDocuments = await _db.collection("users").get();
    var _users = _usersDocuments.docs;
    for (var currentUser in _users) {
      Map userMap = currentUser.data();

      // debugPrint(userMap['name'].toString());
      List<MyUser> newUserList = [];
      MyUser newUser = MyUser(
          userMap['id'].toString(),
          userMap['name'].toString(),
          userMap['email'].toString(),
          userMap['password'].toString());
      newUserList.add(newUser);
      HiveService.newVersionControl(newUserList);
      HiveService.setData(userMap['id'].toString(), userMap['name'].toString(),
          userMap['email'].toString(), userMap['password'].toString());
    }
  }

  /*static readUser({required String userId}) async {
    var _userDoc = await _db.doc('users/lODl1rILhnEeqeiDjBbj').get();
    HiveService.setData(_userDoc.data()!['name'], _userDoc.data()!['email'],
        _userDoc.data()!['password']);
    debugPrint(HiveService.getData()[HiveService.getData().length - 1].name);
  }
  */
}
