
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/domains/entities/product.dart';
import 'package:products/domains/use_cases/get_single_product.dart';
import 'package:products/presentations/states/product_detail_state.dart';


typedef ProductDetailStateType = GenericState<Product, ProductDetailState>;
class ProductDetailCubit extends Cubit<ProductDetailStateType>{
  ProductDetailCubit() : super(ProductDetailStateType(
    state: ProductDetailInitialState()
  ));

  Future<void> getSingleData({required String id}) async{
    emit(ProductDetailStateType(
      state: ProductDetailLoadingState()
    ));

    final getSingleProduct = sl.get<GetSingleProduct>(instanceName: "getSingleProduct");

    final dataProduct = await getSingleProduct(
      id: int.parse(id)
    );

    if (dataProduct.status == ResponseCodeEnum.success){
      emit(ProductDetailStateType(
        state: ProductDetailLoadedState(),
        data: dataProduct.data,
        message: dataProduct.message
      ));
    } else {
      emit(ProductDetailStateType(
        state: ProductDetailFailedState(),
        data: dataProduct.data,
        error: dataProduct.message
      ));
    }
  }
}