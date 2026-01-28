
import 'package:carts/domains/entities/cart.dart';
import 'package:carts/domains/use_cases/get_spesific_cart.dart';
import 'package:carts/presentations/states/carts_detail_state.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


typedef CartsDetailStateType = GenericState<Cart, CartsDetailState>;
class CartsDetailCubit extends Cubit<CartsDetailStateType>{
  CartsDetailCubit(): super(
    CartsDetailStateType(state: CartsDetailInitialState())
  );

  Future<void> getDetailCart({required String id}) async{
    emit(CartsDetailStateType(state: CartsDetailLoadingState()));

    final getSpesificCart = sl.get<GetSpesificCart>(instanceName: "getSpesificCart");

    final dataCart = await getSpesificCart(id: int.parse(id));

    if (dataCart.status == ResponseCodeEnum.success){
      emit(
        CartsDetailStateType(
          state: CartsDetailLoadedState(),
          message: dataCart.message,
          data: dataCart.data
        ),
      );
    } else {
      emit(
        CartsDetailStateType(
          state: CartsDetailFailedState(),
          error: dataCart.message
        ),
      );
    }
  }
}