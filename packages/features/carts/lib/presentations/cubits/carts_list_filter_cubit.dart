
part of 'carts_list_cubit.dart';


typedef CartsListFilterType = ({
  DateTime? startDate,
  DateTime? endDate,
  String limit,
  String sort
});

class CartsListFilterCubit extends Cubit<CartsListFilterType>{
  CartsListFilterCubit(): super((
    startDate: null,
    endDate: null,
    limit: "select_limit",
    sort: "select_sort"
  ));

  void init(){
    emit((
      startDate: null,
      endDate: null,
      limit: "select_limit",
      sort: "select_sort"
    ));
  }

  void changeDateRangeFilter({
    DateTime? newStartDate,
    DateTime? newEndDate
  }) {
    final (
      :startDate,
      :endDate,
      :limit,
      :sort
    ) = state;

    emit(
      (
       startDate: newStartDate,
       endDate: newEndDate,
       limit: limit,
       sort: sort 
      )
    );
  }

  void changeLimitFilter({
    required String newLimit
  }) {
    final (
      :startDate,
      :endDate,
      :limit,
      :sort
    ) = state;

    emit(
      (
       startDate: startDate,
       endDate: endDate,
       limit: newLimit,
       sort: sort 
      )
    );
  }

  void changeSortFilter({
    required String newSort
  }) {
    final (
      :startDate,
      :endDate,
      :limit,
      :sort
    ) = state;

    emit(
      (
       startDate: startDate,
       endDate: endDate,
       limit: limit,
       sort: newSort 
      )
    );
  }
}