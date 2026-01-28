
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/domains/entities/product.dart';
import 'package:products/domains/use_cases/get_all_category.dart';
import 'package:products/domains/use_cases/get_all_product_by_category_sort.dart';
import 'package:products/domains/use_cases/get_all_products.dart';
import 'package:products/domains/use_cases/get_all_products_sort.dart';
import 'package:products/domains/use_cases/get_product_by_category.dart';
import 'package:products/presentations/states/product_category_state.dart';
import 'package:products/presentations/states/product_list_state.dart';

part 'product_category_cubit.dart';

typedef ProductListStateType = GenericState<List<Product>, ProductListState>;
class ProductListCubit extends Cubit<ProductListStateType>{
  ProductListCubit(): super(ProductListStateType(state: ProductListInitialState()));

  Future<void> getAllProducts() async{
    emit(ProductListStateType(
      data: [],
      state: ProductListLoadingState()
    ));

    final getAllProducts = sl.get<GetAllProducts>(instanceName: "getAllProductsUseCase");

    final dataProducts = await getAllProducts();
    if (dataProducts.status == ResponseCodeEnum.success){
      if (dataProducts.data.isNotEmpty){
        emit(
          ProductListStateType(
            state: ProductListLoadedState(),
            data: dataProducts.data,
            message: dataProducts.message
          )
        );
      } else {
        emit(
          ProductListStateType(
            state: ProductListEmptyState(),
            data: [],
            message: dataProducts.message
          )
        );
      }
    } else {
      emit(
        ProductListStateType(
          state: ProductListFailedState(),
          data: [],
          error: dataProducts.message
        )
      );
    }
  }

  Future<void> getAllProductFilter({
    String? category,
    String? limit,
    String? sort
  }) async{
    emit(ProductListStateType(
      data: [],
      state: ProductListLoadingState()
    ));

    int? limitQuery;
    String? sortQuery;

    if (limit case String dataLimit when limit != "all" && limit != "select_limit"){
      limitQuery = int.parse(dataLimit);
    }

    if (sort case String dataSort when sort != "select_sort"){
      sortQuery = dataSort; 
    }

    late GenericModelOrEntityResponse<List<Product>> dataProducts;
    print(category);

    if (category != null && category != "select_category"){
      final getAllProductByCategorySort = sl.get<GetAllProductByCategorySort>(instanceName: "getAllProductByCategorySort");

      dataProducts = await getAllProductByCategorySort(
        category: category,
        limit: limitQuery,
        sort: sortQuery
      );
    } else {
      final getAllProductSort = sl.get<GetAllProductsSort>(instanceName: "getAllProductsSort");

      dataProducts = await getAllProductSort(
        sort: sortQuery,
        limit: limitQuery
      );
    }

    if (dataProducts.status == ResponseCodeEnum.success){
      if (dataProducts.data.isNotEmpty){
        emit(
          ProductListStateType(
            state: ProductListLoadedState(),
            data: dataProducts.data,
            message: dataProducts.message
          )
        );
      } else {
        emit(
          ProductListStateType(
            state: ProductListEmptyState(),
            data: [],
            message: dataProducts.message
          )
        );
      }
    } else {
      emit(
        ProductListStateType(
          state: ProductListFailedState(),
          data: [],
          error: dataProducts.message
        )
      );
    }
  }
} 