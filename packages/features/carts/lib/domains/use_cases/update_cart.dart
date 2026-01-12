
import 'package:carts/domains/entities/cart.dart';
import 'package:carts/domains/entities/cart_product_detail.dart';
import 'package:core/core.dart';

class UpdateCart{
  final CartRepository _repository;
  
  UpdateCart(this._repository);

  Future<GenericModelOrEntityResponse<Cart>> call({
    required Cart dataRequest,
    required int id
  }) async{
    final createDataToRepository = await _repository.updateCart(data: dataRequest, id: id);

    final dataCartResponse = Cart(
      id: createDataToRepository.data.id,
      userId: createDataToRepository.data.userId,
      date: createDataToRepository.data.date,
      v: createDataToRepository.data.v,
      detailProducts: createDataToRepository.data.detailProducts?.map((cartProductDetailModel){
        return CartProductDetail(
          productId: cartProductDetailModel.productId,
          quantity: cartProductDetailModel.quantity
        );
      }).toList()
    );

    return GenericModelOrEntityResponse(
      status: createDataToRepository.status, 
      message: createDataToRepository.message, 
      data: dataCartResponse
    );
  }
}