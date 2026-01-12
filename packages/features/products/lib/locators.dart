
import 'package:core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:products/datas/data_sources/remote_data_source.dart';
import 'package:products/datas/repositories/product_repository.dart';

void setupProductLocator(GetIt sl){
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(sl(instanceName: "apiHelper")), 
    instanceName: "productRemoteSource"
  );

  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(sl(instanceName: "productRemoteSource")),
    instanceName: "productRepository"
  );
}