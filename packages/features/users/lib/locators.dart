
import 'package:core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:users/datas/data_sources/remote_data_source.dart';
import 'package:users/datas/repositories/user_repository.dart';
import 'package:users/domains/use_cases/get_detail_user.dart';
import 'package:users/domains/use_cases/update_user.dart';
import 'package:users/presentations/cubits/profile_change_password_cubit.dart';
import 'package:users/presentations/cubits/profile_cubit.dart';

void setupUsersLocator(GetIt sl){
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(sl(instanceName: "apiHelper")), 
    instanceName: "userRemoteSource"
  );

  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(sl(instanceName: "userRemoteSource")),
    instanceName: "userRepository"
  );

  sl.registerLazySingleton<GetDetailUser>(() => GetDetailUser(sl(instanceName: "userRepository")), instanceName: "getDetailUser");
  sl.registerLazySingleton<UpdateUser>(() => UpdateUser(sl(instanceName: "userRepository")), instanceName: "updateUser");

  sl.registerFactory<ProfileCubit>(() => ProfileCubit(), instanceName: "profileCubit");

  sl.registerFactory<ProfileChangePasswordCubit>(() => ProfileChangePasswordCubit(), instanceName: "profileChangePasswordCubit");
  sl.registerFactory<ProfileChangePasswordValidationCubit>(() => ProfileChangePasswordValidationCubit(), instanceName: "profileChangePasswordValidationCubit");
}