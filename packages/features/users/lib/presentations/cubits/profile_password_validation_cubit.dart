

part of 'profile_change_password_cubit.dart';

typedef ProfileChangePasswordValidationType = ({
  bool hasMinLength,
  bool hasUppercase,
  bool hasLowercase,
  bool hasNumeric,
  bool hasSymbol
});

class ProfileChangePasswordValidationCubit extends Cubit<ProfileChangePasswordValidationType>{
  ProfileChangePasswordValidationCubit(): super((
    hasMinLength: false,
    hasUppercase: false,
    hasLowercase: false,
    hasNumeric: false,
    hasSymbol: false
  ));

  void updateStateHasMinLength(bool value){
    
    final ProfileChangePasswordValidationType(
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
    
    final ProfileChangePasswordValidationType(
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
    
    final ProfileChangePasswordValidationType(
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
    
    final ProfileChangePasswordValidationType(
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
    
    final ProfileChangePasswordValidationType(
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

  void resetPasswordValidation(){
    emit((hasMinLength: false,
    hasUppercase: false,
    hasLowercase: false,
    hasNumeric: false,
    hasSymbol: false));
  }
}