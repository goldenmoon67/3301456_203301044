import 'package:hive_flutter/hive_flutter.dart';
part 'users.g.dart';
@HiveType(typeId: 1)
class UserInfo{

  @HiveField(0)
  String name;

  @HiveField(1)
  String email;

  @HiveField(2)
  String password;

  UserInfo(this.name, this.email, this.password);
  @override
  String toString() {
    // TODO: implement toString
    return "name:$name , email:$email ,password: $password";
  }
}
