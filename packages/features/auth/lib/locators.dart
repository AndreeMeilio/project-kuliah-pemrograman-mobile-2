
import 'package:auth/datas/data_sources/remote_data_source.dart';
import 'package:auth/datas/repositories/auth_repository.dart';
import 'package:auth/presentations/cubits/login_cubit.dart';
import 'package:core/core.dart';
import 'package:get_it/get_it.dart';

void setupAuthLocator(GetIt sl){
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl(instanceName: "apiHelper")), 
    instanceName: "authRemoteSource"
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(sl(instanceName: "authRemoteSource")),
    instanceName: "authRepository"
  );

  sl.registerFactory<LoginCubit>(() => LoginCubit(sl(instanceName: "authRepository")), instanceName: "loginCubit");
}