
import 'package:bloc/bloc.dart';

typedef ProductFilterStateType = ({
  String category,
  String limit,
  String sort
});

class ProductFilterCubit extends Cubit<ProductFilterStateType>{
  ProductFilterCubit() : super((
    category: "select_category",
    limit: "select_limit",
    sort: "select_sort"
  ));

  void init(){
    emit((
      category: "select_category",
      limit: "select_limit",
      sort: "select_sort"
    ));
  }

  void updateFilterCategory(String value){
    final (:category, :limit, :sort) = state;

    emit((
      category: value,
      limit: limit,
      sort: sort
    ));
  }

  void updateFilterLimit(String value){
    final (:category, :limit, :sort) = state;

    emit((
      category: category,
      limit: value,
      sort: sort
    ));
  }

  void updateFilterSort(String value){
    final (:category, :limit, :sort) = state;

    emit((
      category: category,
      limit: limit,
      sort: value
    ));
  }
}