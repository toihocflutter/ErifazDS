import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_ux_pet/features/authen/repository/authen_repository.dart';

class AuthenRepositoryImpl extends AuthenRepository {
  AuthenRepositoryImpl();

  static const String keyIsLogin = "key_is_login";

  @override
  Future<bool> isLogin() async {
    final SharedPreferences sharedPreference =
        await SharedPreferences.getInstance();
    return sharedPreference.getBool(keyIsLogin) ?? false;
  }
}
