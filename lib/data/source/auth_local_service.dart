import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalService {
  Future<bool> isLoggedIn();
  Future logout();
}

class AuthLocalServiceImpl extends AuthLocalService {
  @override
  Future<bool> isLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
