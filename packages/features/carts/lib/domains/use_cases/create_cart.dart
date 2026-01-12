
import 'package:carts/domains/entities/cart.dart';
import 'package:carts/domains/entities/cart_product_detail.dart';
import 'package:core/core.dart';
import 'package:core/domain/cart_repository.dart';

class CreateCart{
  final CartRepository _repository;
  final Cart dataRequest;
  
  CreateCart(this._repository, {required this.dataRequest});

  Future<GenericModelOrEntityResponse<Cart>> call() async{
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