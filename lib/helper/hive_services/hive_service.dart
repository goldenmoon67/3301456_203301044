import 'package:flutter/cupertino.dart';
import 'package:halisaha_app/helper/firebase_services/firestore_user_service.dart';
import 'package:halisaha_app/model/users.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static int userIndex = 0; //this is for which user is logged ins
  static var list = getData();

  static void setData(String id, String name, String email, String password,
      String imageUrl, String city, String town) {
    if (list.isNotEmpty) {
      for (var element in list) {
        if (element.id == id && readCurrentUser() != null) {
          MyUser _firstCurrentUser = readCurrentUser();
          if (_firstCurrentUser.id == id) {
            takeCurrentUser(name: name, email: email, password: password);
          }

          updateData(id, name, email, password, imageUrl, city, town);
        } else {
          MyUser newUser =
              MyUser(id, name, email, password, imageUrl, city, town);
          var box = Hive.box("userbox");
          box.put(id, newUser);
        }
      }
    } else {
      MyUser newUser = MyUser(id, name, email, password, imageUrl, city, town);
      var box = Hive.box("userbox");
      box.put(id, newUser);
      CrudServices.usersToHive();
    }
  }

  static deleteUsers() async {
    var box = Hive.box("userbox");
    await box.clear();
  }

  static List<MyUser> getData() {
    var box = Hive.box("userbox");
    List<MyUser> myUserList = [];
    for (int i = 0; i < box.length; i++) {
      myUserList.add(box.getAt(i));
    }
    return myUserList;
  }

  static newVersionControl(List<MyUser> newVersion) {
    List<MyUser> myUserList = HiveService.getData();
    for (int i = 0; i < myUserList.length; i++) {
      for (int j = 0; j < newVersion.length; j++) {
        if (myUserList[i].id == newVersion[j].id) {
          MyUser _firstCurrentUser = readCurrentUser();
          if (_firstCurrentUser.id == newVersion[j].id) {
            takeCurrentUser(
                name: newVersion[j].name,
                email: newVersion[j].email,
                password: newVersion[j].password);
          }
          HiveService.updateData(
            myUserList[i].id,
            newVersion[j].name,
            newVersion[j].email,
            newVersion[j].password,
            newVersion[j].imageUrl,
            newVersion[j].city,
            newVersion[j].town,
          );
        }
      }
    }
  }

  static void updateData(String newid, String newName, String newEmail,
      String newPassword, String newImage, String newCity, String newTown) {
    MyUser newUser = MyUser(
        newid, newName, newEmail, newPassword, newImage, newCity, newTown);
    var box = Hive.box("userbox");
    box.put(newid, newUser);
  }

  static userLoggedIn({required String email, required String password}) {
    List<MyUser> myUserList = HiveService.getData();
    debugPrint(myUserList.length.toString());
    for (int i = 0; i < myUserList.length; i++) {
      if (myUserList[i].email == email && myUserList[i].password == password) {
        takeCurrentUser(
            name: myUserList[i].name, email: email, password: password);
        toggle();
        break;
      }
    }
  }

  static takeonce() {
    MyUser _myuser = MyUser(
        "KnNmQaqT7i8lDv0LrRwD",
        "Mirac Altinay",
        "m@altinay",
        "123456",
        "https://firebasestorage.googleapis.com/v0/b/halisahaapp.appspot.com/o/user_profile_image%2FKnNmQaqT7i8lDv0LrRwD?alt=media&token=cb944115-5847-4b2a-b395-0197a0431803",
        "city",
        "town");
    var box = Hive.box('currentUserbox');
    box.add(_myuser);
  }

  static takeCurrentUser(
      {required String name, required String email, required password}) {
    late String id;
    late String imageUrl;
    late String city;
    late String town;
    var userList = getData();
    for (var element in userList) {
      if (element.email == email && element.password == password) {
        id = element.id;
        imageUrl = element.imageUrl;
        city = element.city;
        town = element.town;
        MyUser _myuser =
            MyUser(id, name, email, password, imageUrl, city, town);
        var box = Hive.box('currentUserbox');
        if (box.isNotEmpty) {
          box.putAt(0, _myuser);
        } else {
          box.add(_myuser);
        }
      } else {}
    }
  }

  static readCurrentUser() {
    var box = Hive.box('currentUserbox');
    var result = box.get(0);
    return result;
  }

  static createUserService() {
    var box = Hive.box('informationbox');
    box.putAt(0, 0);
  }

  static resultUser() {
    var box = Hive.box('informationbox');
    var result = box.get(0);
    if (result == 0) {
      return false;
    } else {
      return true;
    }
  }

  static loginHiveonce() {
    var box = Hive.box('informationbox');
    if (box.isEmpty) {
      box.add(0);
    }
  }

  static loginHive() {
    var box = Hive.box('informationbox');
    box.putAt(0, 1);
  }

  static logOutHive() {
    var box = Hive.box('informationbox');
    box.putAt(0, 0);
  }

  static var result = false;
  static toggle() {
    result = true;
  }

  static resultf() {
    return result;
  }
}

/*
 static takeonce() {
    MyUser _myuser = MyUser(
        "KnNmQaqT7i8lDv0LrRwD",
        "sezin güleryüz",
        "ahmet@a",
        "123456",
        "https://firebasestorage.googleapis.com/v0/b/halisahaapp.appspot.com/o/user_profile_image%2FKnNmQaqT7i8lDv0LrRwD?alt=media&token=cb944115-5847-4b2a-b395-0197a0431803",
        "city",
        "town");
    var box = Hive.box('currentUserbox');
    box.putAt(0, _myuser);
  }

*/