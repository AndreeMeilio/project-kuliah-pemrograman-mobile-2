
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/domains/entities/product.dart';
import 'package:products/domains/use_cases/get_all_category.dart';
import 'package:products/domains/use_cases/get_all_products.dart';
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
} 