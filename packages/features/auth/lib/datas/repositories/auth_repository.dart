
import 'package:auth/datas/data_sources/remote_data_source.dart';
import 'package:auth/datas/models/auth_model.dart';
import 'package:auth/domains/entities/auth.dart';
import 'package:core/core.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl(this._remoteDataSource);

  @override
  Future<GenericModelOrEntityResponse<AuthModel>> login({required Auth data}) async{
    final loginRequest = AuthModel(
      username: data.username,
      password: data.password
    );

    final loginResponse = await _remoteDataSource.login(data: loginRequest);

    if (loginResponse.response?.data case Map<String, dynamic> dataLoginResponse when loginResponse.status == ResponseCodeEnum.success){
      loginRequest.token = loginResponse.response?.data["token"];
    } else {
      loginRequest.token = "";
      loginResponse.message = loginResponse.response.toString();
    }

    return GenericModelOrEntityResponse<AuthModel>(
      status: loginResponse.status!, 
      message: loginResponse.message ?? "", 
      data: loginRequest
    );
  }

}