import 'package:dahab/core/utilities/service_locator.dart';
import 'package:dahab/features/login/data/data_source/local_storage.dart';
import 'package:dahab/features/login/data/repositories/login_repository.dart';
import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  String? _username;
  String? _password;
  bool? _isLoggedIn;

  String? get username => _username;
  String? get password => _password;
  Future<bool?> get isLoggedIn async {
    _isLoggedIn = await getIt<LoginRepository>().isLoggedIn();
    return _isLoggedIn;
  }

  Future<void> logIn(String username, String password) async {
    _username = username;
    _password = password;
    await getIt<LoginRepository>().login(username, password);
    _isLoggedIn = true;
    notifyListeners();
  }

  Future<void> logOut() async {
    _username = null;
    _password = null;
    _isLoggedIn = false;
    await getIt<LoginRepository>().logout();

    notifyListeners();
  }
}
