
import 'package:core/domain/product_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:products/datas/data_sources/remote_data_source.dart';
import 'package:products/datas/repositories/product_repository.dart';
import 'package:products/domains/use_cases/get_all_category.dart';
import 'package:products/domains/use_cases/get_all_products.dart';
import 'package:products/domains/use_cases/get_single_product.dart';

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