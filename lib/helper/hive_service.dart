
import 'package:halisaha_app/model/users.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService{

  static int userIndex=0;
  static void setData(String name,String email,String password) {
    UserInfo newUser=UserInfo(name, email, password);
    var box=Hive.box("users");
    box.add(newUser);
  }
  static List<UserInfo> getData()  {
    var box=Hive.box("users");
    List<UserInfo> myUserList=[];
    for(int i=0;i<box.length;i++){
      myUserList.add(box.getAt(i));
    }
    return myUserList;
  }
  static void updateData(String newName,newEmail,newPassword){
    UserInfo newUser=UserInfo(newName, newEmail, newPassword);
    var box= Hive.box("users");
    box.putAt(HiveService.userIndex,newUser);
  }
}