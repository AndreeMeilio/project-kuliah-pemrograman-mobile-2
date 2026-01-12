
import 'package:carts/domains/entities/cart.dart';
import 'package:carts/domains/entities/cart_product_detail.dart';
import 'package:core/core.dart';
import 'package:core/domain/cart_repository.dart';

class GetAllCartByUserFilter{
  final CartRepository _repository;
  final int id;
  final int? limit;
  final String? sort;
  final DateTime? startDate;
  final DateTime? endDate;
  
  GetAllCartByUserFilter(this._repository, {
    required this.id,
    this.limit,
    this.sort,
    this.startDate,
    this.endDate,
  });

  Future<GenericModelOrEntityResponse<List<Cart>>> call() async{
    final dataFromRepository = await _repository.getAllCartByUser(
      id: id,
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