
import 'package:auth/domains/entities/auth.dart';
import 'package:core/core.dart';

class Login {
  final AuthRepository _repository;

  Login(this._repository);

  Future<GenericModelOrEntityResponse<Auth>> call({
    required Auth dataLogin 
  }) async{
    final dataResponse = await _repository.login(data: dataLogin);

    return GenericModelOrEntityResponse(
      status: dataResponse.status, 
      message: dataResponse.message, 
      data: Auth(
        username: dataResponse.data.username,
        password: dataResponse.data.password,
        token: dataResponse.data.token
      )
    );
  }
}