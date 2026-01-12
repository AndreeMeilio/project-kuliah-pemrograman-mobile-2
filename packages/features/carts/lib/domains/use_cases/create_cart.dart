
import 'package:carts/domains/entities/cart.dart';
import 'package:carts/domains/entities/cart_product_detail.dart';
import 'package:core/core.dart';

class CreateCart{
  final CartRepository _repository;  
  CreateCart(this._repository);

  Future<GenericModelOrEntityResponse<Cart>> call({
    required Cart dataRequest
  }) async{
    final createDataToRepository = await _repository.createCart(data: dataRequest);

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