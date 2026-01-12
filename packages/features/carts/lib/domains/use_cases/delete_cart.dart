
import 'package:carts/domains/entities/cart.dart';
import 'package:carts/domains/entities/cart_product_detail.dart';
import 'package:core/core.dart';
import 'package:core/domain/cart_repository.dart';

class DeleteCart{
  final CartRepository _repository;
  final int id;
  
  DeleteCart(this._repository, {required this.id});

  Future<GenericModelOrEntityResponse<Cart>> call() async{
    final deleteDataFromRepository = await _repository.deleteCart(id: id);

    final dataCartResponse = Cart(
      id: deleteDataFromRepository.data.id,
      userId: deleteDataFromRepository.data.userId,
      date: deleteDataFromRepository.data.date,
      v: deleteDataFromRepository.data.v,
      detailProducts: deleteDataFromRepository.data.detailProducts?.map((cartProductDetailModel){
        return CartProductDetail(
          productId: cartProductDetailModel.productId,
          quantity: cartProductDetailModel.quantity
        );
      }).toList()
    );

    return GenericModelOrEntityResponse(
      status: deleteDataFromRepository.status, 
      message: deleteDataFromRepository.message, 
      data: dataCartResponse
    );
  }
}