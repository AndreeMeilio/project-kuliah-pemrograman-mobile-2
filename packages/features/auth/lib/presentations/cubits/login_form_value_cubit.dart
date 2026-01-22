part of 'login_cubit.dart';

class LoginRememberMeCheckBoxCubit extends Cubit<bool>{
  LoginRememberMeCheckBoxCubit() : super(false);

  void changeRememberMeValue(bool value){
    emit(value);
  }
}