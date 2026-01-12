
import 'package:auth/domains/entities/auth.dart';
import 'package:core/core.dart';
import 'package:core/domain/auth_repository.dart';

class Login {
  final AuthRepository _repository;
  final Auth dataLogin;

  Login(this._repository, {required this.dataLogin});

  Future<GenericModelOrEntityResponse<Auth>> call() async{
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