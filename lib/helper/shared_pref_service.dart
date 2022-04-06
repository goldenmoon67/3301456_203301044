import 'package:halisaha_app/helper/local_stroge_service.dart';
import 'package:halisaha_app/model/users.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService implements LocalStorageService{
late final SharedPreferences preferences;
  SharedPreferenceService() {
    init();
  }
Future<void> init() async {
  preferences = await SharedPreferences.getInstance();
}
@override
Future<void> setData(UserInfo userInfo)async {
  final _name = userInfo.name;
  final _email = userInfo.email;
  final _password= userInfo.password;
  preferences.setString("name", _name);
  preferences.setString("email", _email);
  preferences.setString("password", _password);
}

  @override
  Future<UserInfo> readData() async {
    String _name = preferences.getString('name') ?? '';
    String _email = preferences.getString('email') ?? '';
    String _password = preferences.getString('password') ?? '';
    return UserInfo(_name,_email, _password);
  }
}
