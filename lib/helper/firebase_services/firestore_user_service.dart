import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:halisaha_app/helper/hive_services/hive_service.dart';
import 'package:halisaha_app/model/users.dart';
import 'package:image_picker/image_picker.dart';

class CrudServices {
  static final _db = FirebaseFirestore.instance;
  static int userCount = 0;
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

  static updateImage(String image) {
    MyUser _myuser = HiveService.readCurrentUser();

    HiveService.updateData(_myuser.id, _myuser.name, _myuser.email,
        _myuser.password, image, _myuser.city, _myuser.town);
    HiveService.takeCurrentUser(
        name: _myuser.name, email: _myuser.email, password: _myuser.password);
  }

  static updateUser({
    required String email,
    required String name,
    required String password,
    required String city,
    required String town,
  }) {
    MyUser _myuser = HiveService.readCurrentUser();
    CollectionReference users = _db.collection("users");
    users
        .doc(_myuser.id)
        .update({
          'email': email,
          'name': name,
          'password': password,
          'profile_image': _myuser.imageUrl,
          'city': city,
          'town': town
        })
        .then((value) => debugPrint("User Updated"))
        .catchError((error) => debugPrint("Failed to update user: $error"));
  }

  static countUsers() async {
    final docRef = _db.collection("counter").doc("user_counter");
    docRef.get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        int result = data['result'];
        userCount = result;
      },
      onError: (e) => debugPrint("Error getting document: $e"),
    );
  }

  static plusPlusUsers() {
    final docRef = _db.collection("counter").doc("user_counter");
    docRef.get().then((DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      int result = data['result'];
      _db.doc('counter/user_counter').set({'result': ++result});
    });
  }

  static usersToHive() async {
    _db.collection("users").snapshots().listen((event) {
      final users = [];
      for (var doc in event.docs) {
        debugPrint("usertohive");
        users.add(doc.data());
        debugPrint(doc.data()['name'].toString());
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

  static kameraGaleriImageUpload({required bool type}) async {
    final MyUser _currentUser = HiveService.readCurrentUser();
    final ImagePicker _picker = ImagePicker();

    XFile? _file = await _picker.pickImage(
        source: type == true ? ImageSource.gallery : ImageSource.camera);

    if (_file == null) {}
    var _profileRef =
        FirebaseStorage.instance.ref('user_profile_image/${_currentUser.id}');

    var _task = _profileRef.putFile(File(_file!.path));
    _task.whenComplete(() async {
      var _url = await _profileRef.getDownloadURL();
      updateImage(_url);
      _db
          .doc('users/${_currentUser.id}')
          .set({'profile_image': _url.toString()}, SetOptions(merge: true));
      usersToHive();
      // HiveService.takeCurrentUser(name: name, email: email, password: password),
    });
  }
}
