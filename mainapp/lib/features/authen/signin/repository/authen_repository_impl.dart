import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_ux_pet/features/authen/signin/repository/service/tetgaa_authen_service.dart';

import 'authen_repository.dart';

class AuthenRepositoryImpl extends AuthenRepository {
  AuthenRepositoryImpl({required TetgaaAuthenService tetgaaAuthenService})
      : _tetgaaAuthenService = tetgaaAuthenService;

  static const String keyIsLogin = "key_is_login";
  final TetgaaAuthenService _tetgaaAuthenService;

  @override
  Future<bool> isLogin() async {
    final SharedPreferences sharedPreference =
        await SharedPreferences.getInstance();
    return sharedPreference.getBool(keyIsLogin) ?? false;
  }

  @override
  Future<void> signIn(
      {required String userName, required String password}) async {
    await _tetgaaAuthenService.signIn(userName: userName, password: password);
  }
}
