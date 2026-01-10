
import 'package:core/database/database_config.dart';
import 'package:core/database/database_helper.dart';
import 'package:core/network/api_config.dart';
import 'package:core/network/api_helper.dart';
import 'package:countries/injection.dart';
import 'package:todos/injection.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupLocators() async{
  // Local Database
  sl.registerLazySingleton<DatabaseConfig>(() => DatabaseConfig());
  sl.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // Remote Api
  sl.registerLazySingleton<ApiConfig>(() => ApiConfig());
  sl.registerLazySingleton<ApiHelper>(() => ApiHelper(apiConfig: sl()));

  TodosInjection.setup();
  CountryInjection.setup();
}