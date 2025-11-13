
import 'package:bloc/bloc.dart';
import 'package:rest_well_aurant/data/models/restaurant_model.dart';
import 'package:rest_well_aurant/data/repositories/restaurant_repository.dart';
import 'package:rest_well_aurant/utils/generic_state.dart';

sealed class RestaurantSearchState {}
class RestaurantSearchInitialState extends RestaurantSearchState{}
class RestaurantSearchLoadingState extends RestaurantSearchState{}
class RestaurantSearchLoadedState extends RestaurantSearchState{}
class RestaurantSearchFailedState extends RestaurantSearchState{}

typedef RestaurantSearchStateType = GenericState<RestaurantSearchState, List<Restaurant>>;

class RestaurantSearchCubit extends Cubit<RestaurantSearchStateType>{
  final RestaurantRepository repository = RestaurantRepository.getInstance();

  RestaurantSearchCubit(): super(RestaurantSearchStateType(
    state: RestaurantSearchInitialState()
  ));

  Future<void> getListRestaurant() async{
    emit(RestaurantSearchStateType(state: RestaurantSearchLoadingState()));

    final response = await repository.getAllRestaurant();

    if (!response.error){
      emit(
        RestaurantSearchStateType(
          message: response.message,
          state: RestaurantSearchLoadedState(),
          data: response.data
        )
      );
    } else {
      emit(
        RestaurantSearchStateType(
          message: response.message,
          state: RestaurantSearchFailedState(),
          data: response.data
        )
      );
    }
  }

  Future<void> searchRestaurant({required String key}) async {
    emit(RestaurantSearchStateType(state: RestaurantSearchLoadingState()));

    final response = await repository.searchRestaurant(key: key);

    if (!response.error){
      emit(
        RestaurantSearchStateType(
          message: response.message,
          state: RestaurantSearchLoadedState(),
          data: response.data
        )
      );
    } else {
      emit(
        RestaurantSearchStateType(
          message: response.message,
          state: RestaurantSearchFailedState(),
          data: response.data
        )
      );
    }
  }

  void resetStateSearchRestaurant(){
    emit(RestaurantSearchStateType(
      state: RestaurantSearchInitialState()
    ));
  }
}