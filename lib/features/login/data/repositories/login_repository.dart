import 'package:dahab/features/login/data/data_source/local_storage.dart';
import 'package:dahab/features/login/domain/repositories/login_repository.dart';

class LoginRepository extends LoginRepositoryBase {

  LocalStorage localStorage ;

  LoginRepository(this.localStorage);

  @override
  Future<bool> isLoggedIn()async {
    return await localStorage.isLogged();
  }

  @override
  Future<bool> login(String username, String password) async {
    return await localStorage.storeCredentials(username, password);

  }

  @override
  Future<bool> logout() async {
    return await localStorage.logOut();
  }



}
