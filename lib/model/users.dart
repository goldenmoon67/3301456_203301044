import 'package:hive_flutter/hive_flutter.dart';

part 'users.g.dart';

@HiveType(typeId: 1)
class MyUser {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String email;

  @HiveField(3)
  String password;

  MyUser(this.id, this.name, this.email, this.password);
  @override
  String toString() {
    return "id:$id,name:$name , email:$email ,password: $password";
  }
}
