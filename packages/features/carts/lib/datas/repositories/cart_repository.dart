
import 'dart:convert';

import 'package:carts/datas/data_sources/remote_data_source.dart';
import 'package:carts/datas/models/cart_model.dart';
import 'package:carts/datas/models/cart_product_detail_model.dart';
import 'package:carts/domains/entities/cart.dart';
import 'package:core/core.dart';

class CartRepositoryImpl extends CartRepository {
  final CartRemoteDataSource _remoteDataSource;

  CartRepositoryImpl(this._remoteDataSource);

  @override
  Future<GenericModelOrEntityResponse<CartModel>> createCart({required Cart data}) async{
    final dataSource = await _remoteDataSource.createCart(data: CartModel(
      userId: data.userId,
      date: data.date,
      detailProducts: data.detailProducts?.map((product){
        return CartProductDetailModel(
          productId: product.productId,
          quantity: product.quantity
        );
      }).toList()
    ));

    late CartModel dataFinal;
    if (dataSource.response?.data case Map<String, dynamic> dataResponse when dataSource.status == ResponseCodeEnum.success){
      dataFinal = CartModel.fromJson(dataResponse);
    } else {
      dataFinal = CartModel.empty();
    }

    return GenericModelOrEntityResponse<CartModel>(
      status: dataSource.status!, 
      message: dataSource.message ?? "", 
      data: dataFinal
    );
  }

  @override
  Future<GenericModelOrEntityResponse<CartModel>> deleteCart({required int id}) async{
    final dataSource = await _remoteDataSource.deleteCart(id: id);

    late CartModel dataFinal;
    if (dataSource.response?.data case Map<String, dynamic> dataResponse when dataSource.status == ResponseCodeEnum.success){
      dataFinal = CartModel.fromJson(dataResponse);
    } else {
      dataFinal = CartModel.empty();
    }

    return GenericModelOrEntityResponse<CartModel>(
      status: dataSource.status!, 
      message: dataSource.message ?? "", 
      data: dataFinal
    );
  }

  @override
  Future<GenericModelOrEntityResponse<List<CartModel>>> getAllCart({int? limit, String? sort, DateTime? startDate, DateTime? endDate}) async{
    final dataSource = await _remoteDataSource.getAllCarts(
      limit: limit,
      sort: sort,
      startDate: startDate,
      endDate: endDate
    );

    List<CartModel> dataCarts = [];
    
    if (dataSource.response?.data case List dataResponse! when dataSource.status == ResponseCodeEnum.success){
      dataCarts = cartModelFromJson(jsonEncode(dataResponse));
    }

    return GenericModelOrEntityResponse<List<CartModel>>(
      status: dataSource.status!, 
      message: dataSource.message ?? "", 
      data: dataCarts
    );
  }

  @override
  Future<GenericModelOrEntityResponse<List<CartModel>>> getAllCartByUser({required int id, int? limit, String? sort, DateTime? startDate, DateTime? endDate}) async{
    final dataSource = await _remoteDataSource.getAllCartsSpesificUser(
      id: id,
      limit: limit,
      sort: sort,
      startDate: startDate,
      endDate: endDate
    );

    List<CartModel> dataCarts = [];
    
    if (dataSource.response?.data case List dataResponse! when dataSource.status == ResponseCodeEnum.success){
      dataCarts = cartModelFromJson(jsonEncode(dataResponse));
    }

    return GenericModelOrEntityResponse<List<CartModel>>(
      status: dataSource.status!, 
      message: dataSource.message ?? "", 
      data: dataCarts
    );
  }

  @override
  Future<GenericModelOrEntityResponse<CartModel>> getSingleCart({required int id}) async{
    final dataSource = await _remoteDataSource.getSingleCart(
      id: id,
    );

    late CartModel dataCart;
    
    if (dataSource.response?.data case Map<String, dynamic> dataResponse! when dataSource.status == ResponseCodeEnum.success){
      dataCart = CartModel.fromJson(dataResponse);
    } else {
      dataCart = CartModel.empty();
    }

    return GenericModelOrEntityResponse<CartModel>(
      status: dataSource.status!, 
      message: dataSource.message ?? "", 
      data: dataCart
    );
  }

  @override
  Future<GenericModelOrEntityResponse<CartModel>> updateCart({required Cart data, required int id}) async{
    final dataSource = await _remoteDataSource.updateCart(
      id: id,
      data: CartModel(
        userId: data.userId,
        date: data.date,
        detailProducts: data.detailProducts?.map((product){
          return CartProductDetailModel(
            productId: product.productId,
            quantity: product.quantity
          );
        }).toList()
      ),
    );

    late CartModel dataFinal;
    if (dataSource.response?.data case Map<String, dynamic> dataResponse when dataSource.status == ResponseCodeEnum.success){
      dataFinal = CartModel.fromJson(dataResponse);
    } else {
      dataFinal = CartModel.empty();
    }

    return GenericModelOrEntityResponse<CartModel>(
      status: dataSource.status!, 
      message: dataSource.message ?? "", 
      data: dataFinal
    );
  }

}