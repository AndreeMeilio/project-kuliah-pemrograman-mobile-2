
import 'package:carts/api_endpoint.dart';
import 'package:carts/datas/models/cart_model.dart';
import 'package:core/network/api_helper.dart';
import 'package:core/responses/api_helper_response.dart';
import 'package:core/utils/date_format.dart';

abstract class CartRemoteDataSource {
  Future<ApiHelperResponse> getAllCarts({
    int? limit,
    String? sort,
    DateTime? startDate,
    DateTime? endDate,
  });
  Future<ApiHelperResponse> getSingleCart({required int id});
  Future<ApiHelperResponse> getAllCartsSpesificUser({
    required int id,
    int? limit,
    String? sort,
    DateTime? startDate,
    DateTime? endDate,
  });
  Future<ApiHelperResponse> createCart({required CartModel data});
  Future<ApiHelperResponse> updateCart({
    required CartModel data,
    required int id,
  });
  Future<ApiHelperResponse> deleteCart({required int id});
}

class CartRemoteDataSourceImpl extends CartRemoteDataSource {
  late ApiHelper _api;

  CartRemoteDataSourceImpl(ApiHelper api) {
    _api = api;
  }

  @override
  Future<ApiHelperResponse> createCart({required CartModel data}) async{
    final response = await _api(
      path: ApiEndpoint.cart,
      method: ApiHelperMethod.post,
      data: data.toJson(),
    );

    return response;
  }

  @override
  Future<ApiHelperResponse> deleteCart({required int id}) async{
    final response = await _api(
      path: ApiEndpoint.cartWithId(id: id.toString()),
      method: ApiHelperMethod.delete
    );

    return response;
  }

  @override
  Future<ApiHelperResponse> getAllCarts({
    int? limit,
    String? sort,
    DateTime? startDate,
    DateTime? endDate,
  }) async{
    Map<String, dynamic> query= {};

    if (limit case int limit){
      query.addAll({
        "limit": limit
      });
    }

    if (sort case String sort){
      query.addAll({
        "sort": sort
      });
    }

    if (startDate case DateTime startDate){
      query.addAll({
        "startdate": AppDateFormat.yyyymmdd(startDate)
      });
    }

    if (endDate case DateTime endDate){
      query.addAll({
        "enddate": AppDateFormat.yyyymmdd(endDate)
      });
    }

    final response = await _api(
      path: ApiEndpoint.cart,
      queryParameters: query
    );

    return response;
  }

  @override
  Future<ApiHelperResponse> getAllCartsSpesificUser({
    required int id,
    int? limit,
    String? sort,
    DateTime? startDate,
    DateTime? endDate,
  }) async{
    Map<String, dynamic> query= {};

    if (limit case int limit){
      query.addAll({
        "limit": limit
      });
    }

    if (sort case String sort){
      query.addAll({
        "sort": sort
      });
    }

    if (startDate case DateTime startDate){
      query.addAll({
        "startdate": AppDateFormat.yyyymmdd(startDate)
      });
    }

    if (endDate case DateTime endDate){
      query.addAll({
        "enddate": AppDateFormat.yyyymmdd(endDate)
      });
    }

    final response = await _api(
      path: ApiEndpoint.cartUserWithId(id: id.toString()),
      queryParameters: query
    );

    return response;
  }

  @override
  Future<ApiHelperResponse> getSingleCart({required int id}) async{
    final response = await _api(
      path: ApiEndpoint.cartWithId(id: id.toString())
    );

    return response;
  }

  @override
  Future<ApiHelperResponse> updateCart({
    required CartModel data,
    required int id,
  }) async{
    final response = await _api(
      path: ApiEndpoint.cartWithId(id: id.toString()),
      method: ApiHelperMethod.put,
      data: data.toJson()
    );

    return response;
  }
}
