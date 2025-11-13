
import 'package:bloc/bloc.dart';
import 'package:rest_well_aurant/data/models/restaurant_model.dart';
import 'package:rest_well_aurant/data/repositories/restaurant_repository.dart';
import 'package:rest_well_aurant/utils/generic_state.dart';

sealed class RestaurantDetailState {}
class RestaurantDetailInitialState extends RestaurantDetailState{}
class RestaurantDetailLoadingState extends RestaurantDetailState{}
class RestaurantDetailLoadedState extends RestaurantDetailState{}
class RestaurantDetailFailedState extends RestaurantDetailState{}

typedef RestaurantDetailStateType = GenericState<RestaurantDetailState, Restaurant>;

class RestaurantDetailCubit extends Cubit<RestaurantDetailStateType>{
  final RestaurantRepository repository = RestaurantRepository.getInstance();

  RestaurantDetailCubit(): super(RestaurantDetailStateType(
    state: RestaurantDetailInitialState()
  ));

  Future<void> getDetailRestaurant({required String id}) async{
    emit(RestaurantDetailStateType(state: RestaurantDetailLoadingState()));

    final response = await repository.getDetailRestaurant(id: id);

    if (!response.error){
      emit(
        RestaurantDetailStateType(
          message: response.message,
          state: RestaurantDetailLoadedState(),
          data: response.data
        )
      );
    } else {
      emit(
        RestaurantDetailStateType(
          message: response.message,
          state: RestaurantDetailFailedState(),
          data: response.data
        )
      );
    }
  }
}