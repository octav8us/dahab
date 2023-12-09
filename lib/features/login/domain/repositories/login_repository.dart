abstract class LoginRepositoryBase {
  Future<bool> isLoggedIn();
  Future<bool> login(String username, String password);
  Future<bool> logout();
}
