abstract class AuthenRepository {
  Future<bool> isLogin();

  Future<void> signIn({required String userName, required String password});
}
