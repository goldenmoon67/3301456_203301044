import 'package:halisaha_app/model/users.dart';
import 'package:hive/hive.dart';
part 'team.g.dart';

@HiveType(typeId: 2)
class Team {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String shortName;

  @HiveField(3)
  final String city;

  @HiveField(4)
  final String town;

  @HiveField(5)
  final int lastPoint;

  @HiveField(6)
  final String imageUrl;

  @HiveField(7)
  final List<MyUser> members;

  Team(this.id, this.name, this.shortName, this.city, this.town, this.lastPoint,
      this.imageUrl, this.members);
}
