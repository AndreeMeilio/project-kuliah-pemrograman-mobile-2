
import 'package:auth/domains/use_cases/register_user.dart';
import 'package:auth/presentations/states/register_state.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users/users.dart';

typedef RegisterPasswordValidationType = ({
  bool hasMinLength,
  bool hasUppercase,
  bool hasLowercase,
  bool hasNumeric,
  bool hasSymbol
});

class RegisterPasswordValidationCubit extends Cubit<RegisterPasswordValidationType>{
  RegisterPasswordValidationCubit(): super((
    hasMinLength: false,
    hasUppercase: false,
    hasLowercase: false,
    hasNumeric: false,
    hasSymbol: false
  ));

  void updateStateHasMinLength(bool value){
    
    final RegisterPasswordValidationType(
      :hasMinLength,
      :hasUppercase,
      :hasLowercase,
      :hasNumeric,
      :hasSymbol
    ) = state;

    emit((
      hasMinLength: value,
      hasUppercase: hasUppercase,
      hasLowercase: hasLowercase,
      hasNumeric: hasNumeric,
      hasSymbol: hasSymbol
    ));
  }

  void updateStateHasUppercase(bool value){
    
    final RegisterPasswordValidationType(
      :hasMinLength,
      :hasUppercase,
      :hasLowercase,
      :hasNumeric,
      :hasSymbol
    ) = state;

    emit((
      hasMinLength: hasMinLength,
      hasUppercase: value,
      hasLowercase: hasLowercase,
      hasNumeric: hasNumeric,
      hasSymbol: hasSymbol
    ));
  }

  void updateStateHasLowercase(bool value){
    
    final RegisterPasswordValidationType(
      :hasMinLength,
      :hasUppercase,
      :hasLowercase,
      :hasNumeric,
      :hasSymbol
    ) = state;

    emit((
      hasMinLength: hasMinLength,
      hasUppercase: hasUppercase,
      hasLowercase: value,
      hasNumeric: hasNumeric,
      hasSymbol: hasSymbol
    ));
  }

  void updateStateHasNumeric(bool value){
    
    final RegisterPasswordValidationType(
      :hasMinLength,
      :hasUppercase,
      :hasLowercase,
      :hasNumeric,
      :hasSymbol
    ) = state;

    emit((
      hasMinLength: hasMinLength,
      hasUppercase: hasUppercase,
      hasLowercase: hasLowercase,
      hasNumeric: value,
      hasSymbol: hasSymbol
    ));
  }  

  void updateStateHasSymbol(bool value){
    
    final RegisterPasswordValidationType(
      :hasMinLength,
      :hasUppercase,
      :hasLowercase,
      :hasNumeric,
      :hasSymbol
    ) = state;

    emit((
      hasMinLength: hasMinLength,
      hasUppercase: hasUppercase,
      hasLowercase: hasLowercase,
      hasNumeric: hasNumeric,
      hasSymbol: value
    ));
  }
}

typedef RegisterStateType = GenericState<User, RegisterState>;
class RegisterCubit extends Cubit<RegisterStateType>{
  final UserRepository _repository;

  RegisterCubit(this._repository): super(RegisterStateType(state: RegisterInitState()));

  // _usernameController = TextEditingController();
  //   _emailController = TextEditingController();
  //   _passwordController = TextEditingController();
  //   _firstNameController = TextEditingController();
  //   _lastNameControler = TextEditingController();
  //   _phoneController = TextEditingController();
  //   _cityController = TextEditingController();
  //   _latController = TextEditingController();
  //   _longitudeController = TextEditingController();
  //   _streetController = TextEditingController();
  //   _numberController = TextEditingController();
  //   _zipController = TextEditingController();

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
        number: int.parse(number ?? "0"),
        zipcode: zip,
      )
    );

    final registerUser = Register(_repository);
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