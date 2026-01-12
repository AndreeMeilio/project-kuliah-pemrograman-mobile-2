
import 'package:carts/domains/entities/cart.dart';
import 'package:carts/domains/entities/cart_product_detail.dart';
import 'package:core/core.dart';

class GetAllCartFilter{
  final CartRepository _repository;
  
  GetAllCartFilter(this._repository);

  Future<GenericModelOrEntityResponse<List<Cart>>> call({
    int? limit,
    String? sort,
    DateTime? startDate,
    DateTime? endDate 
  }) async{
    final dataFromRepository = await _repository.getAllCart(
      limit: limit,
      sort: sort,
      startDate: startDate,
      endDate: endDate
    );

    final List<Cart> dataCartResponse = dataFromRepository.data.map((cartModel){
      return Cart(
        id: cartModel.id,
        userId: cartModel.userId,
        date: cartModel.date,
        v: cartModel.v,
        detailProducts: cartModel.detailProducts?.map((cartProductDetailModel){
          return CartProductDetail(
            productId: cartProductDetailModel.productId,
            quantity: cartProductDetailModel.quantity
          );
        }).toList()
      );
    }).toList();

    return GenericModelOrEntityResponse(
      status: dataFromRepository.status, 
      message: dataFromRepository.message, 
      data: dataCartResponse
    );
  }
}