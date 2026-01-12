
import 'package:carts/domains/entities/cart.dart';
import 'package:carts/domains/entities/cart_product_detail.dart';
import 'package:core/core.dart';
import 'package:core/domain/cart_repository.dart';

class GetSpesificCart{
  final CartRepository _repository;
  final int id;
  
  GetSpesificCart(this._repository, {
    required this.id,
  });

  Future<GenericModelOrEntityResponse<Cart>> call() async{
    final dataFromRepository = await _repository.getSingleCart(
      id: id,
    );

    final Cart dataCartResponse = Cart(
      id: dataFromRepository.data.id,
      userId: dataFromRepository.data.userId,
      date: dataFromRepository.data.date,
      v: dataFromRepository.data.v,
      detailProducts: dataFromRepository.data.detailProducts?.map((cartProductDetailModel){
        return CartProductDetail(
          productId: cartProductDetailModel.productId,
          quantity: cartProductDetailModel.quantity
        );
      }).toList()
    );

    return GenericModelOrEntityResponse(
      status: dataFromRepository.status, 
      message: dataFromRepository.message, 
      data: dataCartResponse
    );
  }
}