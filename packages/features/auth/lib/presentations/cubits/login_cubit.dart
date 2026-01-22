

import 'package:auth/domains/entities/auth.dart';
import 'package:auth/domains/use_cases/login.dart';
import 'package:auth/presentations/states/login_state.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_form_value_cubit.dart';

typedef LoginGenericState = GenericState<Auth, LoginState>;

class LoginCubit extends Cubit<LoginGenericState>{
  LoginCubit(): super(LoginGenericState(state: LoginInitState()));

  Future<void> login({
    required String username,
    required String password,
    bool? rememberMe
  }) async{
    emit(LoginGenericState(state: LoginLoadingState()));

    final loginUseCase = sl<Login>(instanceName: "loginUseCase");
    final loginResponse = await loginUseCase(dataLogin: Auth(
      username: username,
      password: password
    ));

    if (loginResponse.status == ResponseCodeEnum.success){
      if (rememberMe ?? false){
        await CorePreferences.set<String>(
          PreferencesKey.tokenLogin,
          loginResponse.data.token ?? ""
        );
      }
    
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