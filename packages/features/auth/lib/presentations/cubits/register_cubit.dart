
import 'package:auth/domains/use_cases/register_user.dart';
import 'package:auth/presentations/states/register_state.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users/users.dart';

part 'register_password_validation_cubit.dart';

typedef RegisterStateType = GenericState<User, RegisterState>;
class RegisterCubit extends Cubit<RegisterStateType>{
  RegisterCubit(): super(RegisterStateType(state: RegisterInitState()));

  Future<void> registerUser({
    required String username,
    required String email,
    required String password,
    required String firstName,
    required String lastname,
    required String phone,
    String? city,
    String? latitude,
    String? longitude,
    String? street,
    String? number,
    String? zip
  }) async{
    emit(RegisterStateType(state: RegisterLoadingState()));

    late int numberForRequest;
    if (number case String numberValid when number != ""){
      numberForRequest = int.parse(numberValid);
    } else {
      numberForRequest = 0;
    }

    final dataRequest = User(
      username: username,
      name: UserName(
        firstname: firstName,
        lastname: lastname
      ),
      email: email,
      phone: phone,
      address: UserAddress(
        city: city,
        geolocation: Geolocation(
          lat: latitude,
          long: longitude,
        ),
        street: street,
        number: numberForRequest,
        zipcode: zip,
      )
    );

    final registerUser = sl<Register>(instanceName: "registerUseCase");
    final registerResponse = await registerUser(user: dataRequest);

    if (registerResponse.status == ResponseCodeEnum.success){
      emit(RegisterStateType(
        status: registerResponse.status,
        data: registerResponse.data,
        state: RegisterSuccessState()
      ));
    } else {
      emit(RegisterStateType(
        status: registerResponse.status,
        error: registerResponse.message,
        state: RegisterFailedState()
      ));
    }

  }
}