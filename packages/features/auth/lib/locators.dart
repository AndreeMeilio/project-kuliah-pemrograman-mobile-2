
import 'package:auth/datas/data_sources/remote_data_source.dart';
import 'package:auth/datas/repositories/auth_repository.dart';
import 'package:auth/domains/use_cases/login.dart';
import 'package:auth/domains/use_cases/register_user.dart';
import 'package:auth/presentations/cubits/login_cubit.dart';
import 'package:auth/presentations/cubits/register_cubit.dart';
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

  sl.registerLazySingleton<Login>(() => Login(sl(instanceName: "authRepository")), instanceName: "loginUseCase");
  sl.registerLazySingleton<Register>(() => Register(sl(instanceName: "userRepository")), instanceName: "registerUseCase");

  sl.registerFactory<LoginCubit>(() => LoginCubit(), instanceName: "loginCubit");
  sl.registerFactory<RegisterPasswordValidationCubit>(() => RegisterPasswordValidationCubit(), instanceName: "registerPasswordValidationCubit");
  sl.registerFactory<RegisterCubit>(() => RegisterCubit(), instanceName: "registerCubit");
  sl.registerFactory<LoginRememberMeCheckBoxCubit>(() => LoginRememberMeCheckBoxCubit(), instanceName: "loginRememberMeCheckBoxCubit");
}