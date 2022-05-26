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

  @HiveField(4)
  String imageUrl;

  @HiveField(5)
  String city;

  @HiveField(6)
  String town;

  MyUser(this.id, this.name, this.email, this.password, this.imageUrl,
      this.city, this.town);
  @override
  String toString() {
    return "id:$id,name:$name , email:$email ,password: $password";
  }
}
