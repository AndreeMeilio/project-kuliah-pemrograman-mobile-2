
import 'package:bloc/bloc.dart';
import 'package:rest_well_aurant/data/models/restaurant_model.dart';
import 'package:rest_well_aurant/data/repositories/restaurant_repository.dart';
import 'package:rest_well_aurant/utils/generic_state.dart';

sealed class RestaurantListState {}
class RestaurantListInitialState extends RestaurantListState{}
class RestaurantListLoadingState extends RestaurantListState{}
class RestaurantListLoadedState extends RestaurantListState{}
class RestaurantListFailedState extends RestaurantListState{}

typedef RestaurantListStateType = GenericState<RestaurantListState, List<Restaurant>>;

class RestaurantListCubit extends Cubit<RestaurantListStateType>{
  final RestaurantRepository repository = RestaurantRepository.getInstance();

  RestaurantListCubit(): super(RestaurantListStateType(
    state: RestaurantListInitialState()
  ));

  Future<void> getListRestaurant() async{
    emit(RestaurantListStateType(state: RestaurantListLoadingState()));

    final response = await repository.getAllRestaurant();

    if (!response.error){
      emit(
        RestaurantListStateType(
          message: response.message,
          state: RestaurantListLoadedState(),
          data: response.data
        )
      );
    } else {
      emit(
        RestaurantListStateType(
          message: response.message,
          state: RestaurantListFailedState(),
          data: response.data
        )
      );
    }
  }

  Future<void> searchRestaurant({required String key}) async {
    emit(RestaurantListStateType(state: RestaurantListLoadingState()));

    final response = await repository.searchRestaurant(key: key);

    if (!response.error){
      emit(
        RestaurantListStateType(
          message: response.message,
          state: RestaurantListLoadedState(),
          data: response.data
        )
      );
    } else {
      emit(
        RestaurantListStateType(
          message: response.message,
          state: RestaurantListFailedState(),
          data: response.data
        )
      );
    }
  }
}