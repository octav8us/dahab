import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dahab/features/login/data/data_source/local_storage.dart';
import 'package:dahab/features/login/data/repositories/login_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FlutterSecureStorage>(const FlutterSecureStorage());
  getIt.registerSingleton<LocalStorage>(LocalStorage());
  getIt.registerSingleton<LoginRepository>(
      LoginRepository(getIt<LocalStorage>()));
  getIt.registerSingleton<http.Client>(http.Client());
  getIt.registerSingleton<Connectivity>(Connectivity());
}
