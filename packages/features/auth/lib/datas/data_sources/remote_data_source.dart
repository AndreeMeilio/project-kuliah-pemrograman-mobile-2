
import 'package:auth/api_endpoint.dart';
import 'package:auth/datas/models/auth_model.dart';
import 'package:core/core.dart';

abstract class AuthRemoteDataSource {
  Future<ApiHelperResponse> login({required AuthModel data});
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiHelper _api;

  AuthRemoteDataSourceImpl(this._api);

  @override
  Future<ApiHelperResponse> login({required AuthModel data}) async{
    final response = await _api(
      path: ApiEndpoint.login,
      data: data.toJson(),
      method: ApiHelperMethod.post
    );

    return response;
  }

}