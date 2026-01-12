import 'package:core/core.dart';
import 'package:users/api_endpoint.dart';
import 'package:users/datas/models/user_model.dart';

abstract class UserRemoteDataSource{
  Future<ApiHelperResponse> getAllUsers({int? limit, String? sort});
  Future<ApiHelperResponse> getSingleUser({required int id});
  Future<ApiHelperResponse> createUser({required UserModel data});
  Future<ApiHelperResponse> updateUser({required UserModel data, required int id});
  Future<ApiHelperResponse> deleteUser({required int id});
}

class UserRemoteDataSourceImpl extends UserRemoteDataSource{
  late ApiHelper _api;

  UserRemoteDataSourceImpl(ApiHelper api){
    _api = api;
  }
  
  @override
  Future<ApiHelperResponse<dynamic>> createUser({required UserModel data}) async{
    final response = await _api(
      path: ApiEndpoint.user,
      method: ApiHelperMethod.post,
      data: data.toJson(),
    );

    return response; 
  }
  
  @override
  Future<ApiHelperResponse<dynamic>> deleteUser({required int id}) async{
    final response = await _api(
      path: ApiEndpoint.userWithId(id: id.toString()), 
      method: ApiHelperMethod.delete
    );

    return response;
  }
  
  @override
  Future<ApiHelperResponse<dynamic>> getAllUsers({int? limit, String? sort}) async{
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
      path: ApiEndpoint.user,
      queryParameters: query
    );

    return response;
  }
  
  @override
  Future<ApiHelperResponse<dynamic>> getSingleUser({required int id}) async{
    final response = await _api(
      path: ApiEndpoint.userWithId(id: id.toString())
    );

    return response;
  }
  
  @override
  Future<ApiHelperResponse<dynamic>> updateUser({required UserModel data, required int id}) async{
    final response = await _api(
      path: ApiEndpoint.userWithId(id: id.toString()),
      method: ApiHelperMethod.put,
      data: data.toJson(),
    );

    return response; 
  }

}
