part of 'product_list_cubit.dart';


typedef ProductCategoryStateType = GenericState<List<String>, ProductCategoryState>;
class ProductCategoryCubit extends Cubit<ProductCategoryStateType>{
  ProductCategoryCubit(): super(ProductCategoryStateType(
    state: ProductCategoryInitialState()
  ));

  Future<void> getAllCategory() async{
    emit(ProductCategoryStateType(state: ProductCategoryLoadingState()));

    final getAllCategory = sl.get<GetAllCategory>(instanceName: "getAllCategory");

    final dataCategory = await getAllCategory();
    if (dataCategory.status == ResponseCodeEnum.success){
      emit(ProductCategoryStateType(
        state: ProductCategoryLoadedState(),
        data: dataCategory.data,
        message: dataCategory.message
      ));
    } else {
      emit(ProductCategoryStateType(
        state: ProductCategoryFailedState(),
        data: dataCategory.data,
        error: dataCategory.message
      ));
    }
  }
}