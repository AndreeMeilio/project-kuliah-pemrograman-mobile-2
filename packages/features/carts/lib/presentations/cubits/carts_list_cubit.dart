
import 'package:carts/domains/entities/cart.dart';
import 'package:carts/domains/use_cases/get_all_cart_filter.dart';
import 'package:carts/domains/use_cases/get_all_carts.dart';
import 'package:carts/presentations/states/carts_list_state.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'carts_list_filter_cubit.dart';

typedef CartsListStateType = GenericState<List<Cart>, CartsListState>;

class CartsListCubit extends Cubit<CartsListStateType>{
  CartsListCubit() :super(CartsListStateType(
    state: CartsListInitialState()
  ));

  Future<void> getAllCarts() async{
    emit(CartsListStateType(
      state: CartsListLoadingState()
    ));

    final getAllCarts = sl.get<GetAllCarts>(instanceName: "getAllCarts");
    final dataCarts = await getAllCarts();

    if (dataCarts.status == ResponseCodeEnum.success){
      if (dataCarts.data.isEmpty){
        emit(
          CartsListStateType(
            state: CartsListEmptyState(),
            message: "There are no data carts available"
          )
        );
      } else {
        emit(
          CartsListStateType(
            state: CartsListLoadedState(),
            data: dataCarts.data,
            message: dataCarts.message
          )
        );
      }
    } else {
      emit(
        CartsListStateType(
          state: CartsListFailedState(),
          error: dataCarts.message
        )
      );
    }
  }

  Future<void> getCartsByFilter({
    DateTime? startDate,
    DateTime? endDate,
    String? limit,
    String? sort
  }) async{
    emit(CartsListStateType(
      state: CartsListLoadingState()
    ));

    int? limitQuery;
    String? sortQuery;


    if (limit case String dataLimit when limit != "all" && limit != "select_limit"){
      limitQuery = int.parse(dataLimit);
    }

    if (sort case String dataSort when sort != "select_sort"){
      sortQuery = dataSort; 
    }

    final getAllCartFilter = sl.get<GetAllCartFilter>(instanceName: "getAllCartFilter");
    final dataCarts = await getAllCartFilter(
      startDate: startDate,
      endDate: endDate,
      limit: limitQuery,
      sort: sortQuery
    );

    if (dataCarts.status == ResponseCodeEnum.success){
      if (dataCarts.data.isEmpty){
        emit(
          CartsListStateType(
            state: CartsListEmptyState(),
            message: "There are no data carts available"
          )
        );
      } else {
        emit(
          CartsListStateType(
            state: CartsListLoadedState(),
            data: dataCarts.data,
            message: dataCarts.message
          )
        );
      }
    } else {
      emit(
        CartsListStateType(
          state: CartsListFailedState(),
          error: dataCarts.message
        )
      );
    }
  }
}