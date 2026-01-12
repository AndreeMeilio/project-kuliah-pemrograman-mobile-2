

import 'package:auth/domains/entities/auth.dart';
import 'package:auth/domains/use_cases/login.dart';
import 'package:auth/presentations/states/login_state.dart';
import 'package:core/constant/response_code.dart';
import 'package:core/domain/auth_repository.dart';
import 'package:core/utils/generic_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef LoginGenericState = GenericState<Auth, LoginState>;

class LoginCubit extends Cubit<LoginGenericState>{
  final AuthRepository _repository;

  LoginCubit(this._repository): super(LoginGenericState(state: LoginInitState()));

  Future<void> login({
    required String username,
    required String password
  }) async{
    emit(LoginGenericState(state: LoginLoadingState()));

    final loginUseCase = Login(_repository, dataLogin: Auth(
      username: username,
      password: password
    ));
    final loginResponse = await loginUseCase();

    if (loginResponse.status == ResponseCodeEnum.success){
      emit(LoginGenericState(
        status: loginResponse.status,
        data: loginResponse.data,
        state: LoginSuccessState()
      ));
    } else {
      emit(LoginGenericState(
        status: loginResponse.status,
        error: loginResponse.message,
        state: LoginFailedState()
      ));
    }
  }
}