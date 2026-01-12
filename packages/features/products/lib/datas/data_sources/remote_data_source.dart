import 'package:core/core.dart';
import 'package:products/api_endpoint.dart';
import 'package:products/datas/models/product_model.dart';

abstract class ProductRemoteDataSource{
  Future<ApiHelperResponse> getAllProduct({int? limit, String? sort});
  Future<ApiHelperResponse> getSingleProduct({required int id});
  Future<ApiHelperResponse> getAllCategory();
  Future<ApiHelperResponse> getProductByCategory({required String category, int? limit, String? sort});
  Future<ApiHelperResponse> createNewProduct({required ProductModel data});
  Future<ApiHelperResponse> updateProduct({required ProductModel data, required int id});
  Future<ApiHelperResponse> deleteProduct({required int id});
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource{
  late ApiHelper _api;

  ProductRemoteDataSourceImpl(ApiHelper api){
    _api = api;
  }

  @override
  Future<ApiHelperResponse> createNewProduct({required ProductModel data}) async{
    final response = await _api(
      path: ApiEndpoint.product,
      method: ApiHelperMethod.post,
      data: data.toJson(),
    );

    return response;
  }

  @override
  Future<ApiHelperResponse> deleteProduct({required int id}) async{
    final response = await _api(
      path: ApiEndpoint.productWithId(id: id.toString()), 
      method: ApiHelperMethod.delete
    );

    return response;
  }

  @override
  Future<ApiHelperResponse> getAllCategory() async{
    final response = await _api(path: ApiEndpoint.productCategory);

    return response;
  }

  @override
  Future<ApiHelperResponse> getAllProduct({int? limit, String? sort}) async{
    
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

    final response = await _api(
      path: ApiEndpoint.product,
      queryParameters: query
    );

    return response;
  }

  @override
  Future<ApiHelperResponse> getProductByCategory({required String category, int? limit, String? sort}) async{
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

    final response = await _api(
      path: ApiEndpoint.productWithCategory(category: category),
      queryParameters: query
    );

    return response;
  }

  @override
  Future<ApiHelperResponse> getSingleProduct({required int id}) async{
    final response = await _api(
      path: ApiEndpoint.productWithId(id: id.toString())
    );

    return response;
  }

  @override
  Future<ApiHelperResponse> updateProduct({required ProductModel data, required int id}) async{
    final response = await _api(
      path: ApiEndpoint.productWithId(id: id.toString()),
      method: ApiHelperMethod.put,
      data: data.toJson()
    );

    return response;
  }
  
}
