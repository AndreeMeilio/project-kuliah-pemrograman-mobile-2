

import 'package:carts/datas/data_sources/remote_data_source.dart';
import 'package:carts/datas/repositories/cart_repository.dart';
import 'package:core/core.dart';
import 'package:get_it/get_it.dart';

void setupCartLocator(GetIt sl){
  sl.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(sl(instanceName: "apiHelper")), 
    instanceName: "cartRemoteSource"
  );

  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(sl(instanceName: "cartRemoteSource")),
    instanceName: "cartRepository"
  );
}