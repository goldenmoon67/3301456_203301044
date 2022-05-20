import 'package:flutter/cupertino.dart';
import 'package:halisaha_app/model/users.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static int userIndex = 0; //this is for which user is logged in

  static void setData(String id, String name, String email, String password) {
    MyUser newUser = MyUser(id, name, email, password);
    var box = Hive.box("user");
    box.add(newUser);
  }

  static List<MyUser> getData() {
    var box = Hive.box("user");
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
          debugPrint("this worked");
          MyUser _firstCurrentUser = readCurrentUser();
          debugPrint(_firstCurrentUser.toString());
          if (_firstCurrentUser.id == newVersion[j].id) {
            debugPrint("this worked2");
            takeCurrentUser(
                name: newVersion[j].name,
                email: newVersion[j].email,
                password: newVersion[j].password);
          }
          HiveService.updateData(myUserList[i].id, newVersion[j].name,
              newVersion[j].email, newVersion[j].password,
              index: i);
        }
      }
    }
  }

  static void updateData(
      String newid, String newName, String newEmail, String newPassword,
      {required int index}) {
    MyUser newUser = MyUser(newid, newName, newEmail, newPassword);
    var box = Hive.box("user");
    box.putAt(index, newUser);
  }

  static userLoggedIn({required String email, required String password}) {
    List<MyUser> myUserList = HiveService.getData();
    for (int i = 0; i < myUserList.length; i++) {
      if (myUserList[i].email == email && myUserList[i].password == password) {
        takeCurrentUser(
            name: myUserList[i].name, email: email, password: password);
        toggle();
        break;
      }
    }
  }

  static takeCurrentUser(
      {required String name, required String email, required password}) {
    late String id;
    var userList = getData();
    userList.forEach((element) {
      if (element.email == email && element.password == password) {
        id = element.id;
      } else {}
    });
    MyUser _myuser = MyUser(id, name, email, password);
    var box = Hive.box('currentUser');
    box.putAt(0, _myuser);
  }

  static readCurrentUser() {
    var box = Hive.box('currentUser');
    var result = box.get(0);
    return result;
  }

  static createUserService() {
    var box = Hive.box('infoBox');
    box.putAt(0, 0);
  }

  static resultUser() {
    var box = Hive.box('infoBox');
    var result = box.get(0);
    if (result == 0) {
      return false;
    } else {
      return true;
    }
  }

  static loginHive() {
    var box = Hive.box('infoBox');
    box.putAt(0, 1);
  }

  static logOutHive() {
    var box = Hive.box('infoBox');
    box.putAt(0, 0);
  }

  static var result = false;
  static toggle() {
    result = true;
    debugPrint("togggleee" + resultf().toString());
  }

  static resultf() {
    return result;
  }
}
