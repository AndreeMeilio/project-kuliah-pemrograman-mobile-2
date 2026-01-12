
import 'package:carts/domains/entities/cart.dart';
import 'package:carts/domains/entities/cart_product_detail.dart';
import 'package:core/core.dart';
import 'package:core/domain/cart_repository.dart';

class UpdateCart{
  final CartRepository _repository;
  final Cart dataRequest;
  final int id;
  
  UpdateCart(this._repository, {required this.dataRequest, required this.id});

  Future<GenericModelOrEntityResponse<Cart>> call() async{
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