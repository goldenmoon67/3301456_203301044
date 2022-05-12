import 'package:cloud_firestore/cloud_firestore.dart';

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
}
