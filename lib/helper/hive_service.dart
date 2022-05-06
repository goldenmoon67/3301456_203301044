import 'package:halisaha_app/model/users.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static int userIndex = 0; //this is for which user is logged in

  static void setData(String name, String email, String password) {
    MyUser newUser = MyUser(name, email, password);
    var box = Hive.box("users");
    box.add(newUser);
  }

  static List<MyUser> getData() {
    var box = Hive.box("users");
    List<MyUser> myUserList = [];
    for (int i = 0; i < box.length; i++) {
      myUserList.add(box.getAt(i));
    }
    return myUserList;
  }

  static void updateData(String newName, newEmail, newPassword) {
    MyUser newUser = MyUser(newName, newEmail, newPassword);
    var box = Hive.box("users");
    box.putAt(HiveService.userIndex, newUser);
  }
}
