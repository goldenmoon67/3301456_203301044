
import 'package:halisaha_app/model/users.dart';

abstract class LocalStorageService {
  Future<void> setData(UserInfo userInfo);
  Future<UserInfo> readData();
}
