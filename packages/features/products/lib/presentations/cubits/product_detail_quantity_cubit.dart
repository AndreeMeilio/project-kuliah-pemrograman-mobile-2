
part of 'product_detail_cubit.dart';

enum TypeChangeQuantity {
  minus,
  plus
}

class ProductDetailQuantityCubit extends Cubit<int>{
  ProductDetailQuantityCubit() :super(1);

  void changeQuantityProduct({required TypeChangeQuantity type}){
    if (type == TypeChangeQuantity.minus && state <= 1){
      emit(1);
    } else {
      final newValue = type == TypeChangeQuantity.plus ? state + 1 : state - 1;

      emit(newValue);
    }
  }
}