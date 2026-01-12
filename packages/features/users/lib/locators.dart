
import 'package:core/domain/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:users/datas/data_sources/remote_data_source.dart';
import 'package:users/datas/repositories/user_repository.dart';

void setupUsersLocator(GetIt sl){
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(sl(instanceName: "apiHelper")), 
    instanceName: "userRemoteSource"
  );

  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(sl(instanceName: "userRemoteSource")),
    instanceName: "userRepository"
  );
}