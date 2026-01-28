

import 'package:carts/datas/data_sources/remote_data_source.dart';
import 'package:carts/datas/repositories/cart_repository.dart';
import 'package:carts/domains/use_cases/get_all_carts.dart';
import 'package:carts/domains/use_cases/get_spesific_cart.dart';
import 'package:carts/presentations/cubits/carts_detail_cubit.dart';
import 'package:carts/presentations/cubits/carts_list_cubit.dart';
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

  sl.registerLazySingleton<GetAllCarts>(() => GetAllCarts(sl(instanceName: "cartRepository")), instanceName: "getAllCarts");

  sl.registerFactory<CartsListCubit>(() =>CartsListCubit(), instanceName: "cartsListCubit");

  sl.registerFactory<GetSpesificCart>(() => GetSpesificCart(sl(instanceName: "cartRepository"), sl<ProductRepository>(instanceName: "productRepository")), instanceName: "getSpesificCart");

  sl.registerFactory<CartsDetailCubit>(() => CartsDetailCubit(), instanceName: "cartsDetailCubit");
}