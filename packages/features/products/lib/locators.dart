
import 'package:core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:products/datas/data_sources/remote_data_source.dart';
import 'package:products/datas/repositories/product_repository.dart';
import 'package:products/domains/use_cases/get_all_category.dart';
import 'package:products/domains/use_cases/get_all_product_by_category_sort.dart';
import 'package:products/domains/use_cases/get_all_products.dart';
import 'package:products/domains/use_cases/get_all_products_sort.dart';
import 'package:products/domains/use_cases/get_product_by_category.dart';
import 'package:products/domains/use_cases/get_single_product.dart';
import 'package:products/presentations/cubits/home_cubit.dart';
import 'package:products/presentations/cubits/product_detail_cubit.dart';
import 'package:products/presentations/cubits/product_filter_cubit.dart';
import 'package:products/presentations/cubits/product_list_cubit.dart';

void setupProductLocator(GetIt sl){
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(sl(instanceName: "apiHelper")), 
    instanceName: "productRemoteSource"
  );

  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(sl(instanceName: "productRemoteSource")),
    instanceName: "productRepository"
  );

  // USE CASES
  sl.registerLazySingleton<GetAllProducts>(() => GetAllProducts(sl(instanceName: "productRepository")), instanceName: "getAllProductsUseCase");
  sl.registerLazySingleton<GetSingleProduct>(() => GetSingleProduct(sl(instanceName: "productRepository")), instanceName: "getSingleProduct");
  sl.registerLazySingleton<GetAllCategory>(() => GetAllCategory(sl(instanceName: "productRepository")), instanceName: "getAllCategory");
  sl.registerLazySingleton<GetProductByCategory>(() => GetProductByCategory(sl(instanceName: "productRepository")), instanceName: "getProductByCategory");
  sl.registerLazySingleton<GetAllProductsSort>(() => GetAllProductsSort(sl(instanceName: "productRepository")), instanceName: "getAllProductsSort");
  sl.registerLazySingleton<GetAllProductByCategorySort>(() => GetAllProductByCategorySort(sl(instanceName: "productRepository")), instanceName: "getAllProductByCategorySort");

  // CUBIT
  sl.registerFactory<ProductListCubit>(() => ProductListCubit(), instanceName: "productListCubit");
  sl.registerFactory<HomeCubit>(() => HomeCubit(), instanceName: "homeCubit");
  sl.registerFactory<ProductDetailCubit>(() => ProductDetailCubit(), instanceName: "productDetailCubit");
  sl.registerFactory<ProductCategoryCubit>(() => ProductCategoryCubit(), instanceName: "productCategoryCubit");
  sl.registerFactory<ProductFilterCubit>(() => ProductFilterCubit(), instanceName: "productFilterCubit");
  sl.registerFactory<ProductDetailQuantityCubit>(() => ProductDetailQuantityCubit(), instanceName: "productDetailQuantityCubit");
}