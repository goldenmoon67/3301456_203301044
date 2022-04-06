
import 'package:halisaha_app/model/users.dart';
import 'package:get_it/get_it.dart';
abstract class LocalStorageService {
  Future<void> setData(UserInfo userInfo);
  Future<UserInfo> readData();
}
