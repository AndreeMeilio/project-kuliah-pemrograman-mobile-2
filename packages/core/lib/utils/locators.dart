
import 'package:auth/auth.dart';
import 'package:carts/carts.dart';
import 'package:core/database/database_config.dart';
import 'package:core/database/database_helper.dart';
import 'package:core/network/api_config.dart';
import 'package:core/network/api_helper.dart';
import 'package:get_it/get_it.dart';
import 'package:products/products.dart';
import 'package:users/users.dart';

final sl = GetIt.instance;

void setupLocators() async{
  // Local Database
  sl.registerLazySingleton<DatabaseConfig>(() => DatabaseConfig(), instanceName: "databaseConfig");
  sl.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper(), instanceName: "databaseHelper");

  // Remote Api
  sl.registerLazySingleton<ApiConfig>(() => ApiConfig(), instanceName: "apiConfig");
  sl.registerLazySingleton<ApiHelper>(() => ApiHelper(apiConfig: sl(instanceName: "apiConfig")), instanceName: "apiHelper");

  setupProductLocator(sl);
  setupCartLocator(sl);
  setupUsersLocator(sl);
  setupAuthLocator(sl);
}