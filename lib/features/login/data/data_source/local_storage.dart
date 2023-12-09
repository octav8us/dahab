import 'package:dahab/core/utilities/service_locator.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
// Create storage
  final storage = getIt<FlutterSecureStorage>();

  Future<bool> isLogged() async {
    return await storage.containsKey(key: "userName");
  }

  Future<bool> storeCredentials(String userName, String password) async {
    try {
      await storage.write(key: "userName", value: userName);
      await storage.write(key: "password", value: password);
      return true;
    } catch (storageException) {
      return false;
    }
  }

  Future<bool> logOut() async {
    try {
      await storage.delete(key: "userName");
      await storage.delete(key: "password");
      return true;
    } catch (storageException) {
      return false;
    }
  }
}
