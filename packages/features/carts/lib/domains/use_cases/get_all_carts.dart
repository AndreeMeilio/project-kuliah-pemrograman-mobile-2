
import 'package:carts/domains/entities/cart.dart';
import 'package:carts/domains/entities/cart_product_detail.dart';
import 'package:core/core.dart';

class GetAllCarts{
  final CartRepository _repository;
  
  GetAllCarts(this._repository);

  Future<GenericModelOrEntityResponse<List<Cart>>> call() async{
    final dataFromRepository = await _repository.getAllCart();

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