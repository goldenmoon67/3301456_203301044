import 'package:flutter/material.dart';
import 'package:halisaha_app/model/users.dart';
import 'package:hive/hive.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        var box=Hive.box("users");
        List<UserInfo> myUserList=[];
        for(int i=0;i<box.length;i++){
          myUserList.add(box.getAt(i));
        }
        debugPrint(myUserList[0].email.toString());
      },
      child: const Text(
        'Şiremi Unuttum',
        style: TextStyle(
          color: Colors.blue,
        ),
      ),
    );
  }
}
