
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rest_well_aurant/data/models/customer_review_model.dart';
import 'package:rest_well_aurant/data/repositories/restaurant_repository.dart';
import 'package:rest_well_aurant/utils/generic_state.dart';

sealed class CustomerReviewListState {}
class CustomerReviewListInitialState extends CustomerReviewListState{}
class CustomerReviewListLoadingState extends CustomerReviewListState{}
class CustomerReviewListLoadedState extends CustomerReviewListState{}
class CustomerReviewListFailedState extends CustomerReviewListState{}

typedef CustomerReviewListStateType = GenericState<CustomerReviewListState, List<CustomerReview>>;

class CustomerReviewListCubit extends Cubit<CustomerReviewListStateType>{
  final RestaurantRepository repository = RestaurantRepository.getInstance();
  
  CustomerReviewListCubit(): super(
    CustomerReviewListStateType(state: CustomerReviewListInitialState())
  );

  Future<void> addCustomerReview({
    required String id,
    required String name,
    required String review,
  }) async {
    emit(CustomerReviewListStateType(state: CustomerReviewListLoadingState()));

    CustomerReview requestData = CustomerReview(
      name: name,
      review: review,
      date: DateTime.now().toString()
    );

    final response = await repository.addNewReview(
      id: id,
      review: requestData
    );

    if (!response.error){
      emit(
        CustomerReviewListStateType(
          message: response.message,
          state: CustomerReviewListLoadedState(),
          data: response.data
        )
      );
    } else {
      emit(
        CustomerReviewListStateType(
          message: response.message,
          state: CustomerReviewListFailedState(),
          data: response.data
        )
      );
    }
  }
}