
import 'package:carts/carts.dart';
import 'package:core/utils/generic_model_or_entity_response.dart';

abstract class CartRepository {
  Future<GenericModelOrEntityResponse<List<CartModel>>> getAllCart({int? limit, String? sort, DateTime? startDate, DateTime? endDate});
  Future<GenericModelOrEntityResponse<CartModel>> getSingleCart({required int id});
  Future<GenericModelOrEntityResponse<List<CartModel>>> getAllCartByUser({required int id, int? limit, String? sort, DateTime? startDate, DateTime? endDate});
  Future<GenericModelOrEntityResponse<CartModel>> createCart({required Cart data});
  Future<GenericModelOrEntityResponse<CartModel>> updateCart({required Cart data, required int id});
  Future<GenericModelOrEntityResponse<CartModel>> deleteCart({required int id});
} 
  