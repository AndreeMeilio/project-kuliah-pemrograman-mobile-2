
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users/domains/entities/user.dart';
import 'package:users/domains/use_cases/update_user.dart';
import 'package:users/presentations/states/profile_change_password_state.dart';

part 'profile_password_validation_cubit.dart';

typedef ProfileChangePasswordStateType = GenericState<User, ProfileChangePasswordState>;
class ProfileChangePasswordCubit extends Cubit<ProfileChangePasswordStateType>{
  ProfileChangePasswordCubit(): super(ProfileChangePasswordStateType(state: ProfileChangePasswordInitialState()));

  Future<void> changePassword({
    required User user, 
    required String newPassword,
    required String oldPassword
  }) async{
    emit(
      ProfileChangePasswordStateType(
        state: ProfileChangePasswordLoadingState()
      )
    );

    if ((user.password ?? "") == oldPassword){
      final updateUser = sl.get<UpdateUser>(instanceName: "updateUser");

      user.password = newPassword;

      final changePassword = await updateUser(id: user.id ?? 0, user: user);

      if (changePassword.status == ResponseCodeEnum.success){
        emit(
          ProfileChangePasswordStateType(
            state: ProfileChangePasswordSuccessState(),
            data: changePassword.data,
            message: changePassword.message
          )
        );
      } else {
        emit(
          ProfileChangePasswordStateType(
            state: ProfileChangePasswordFailedState(),
            error: changePassword.message
          )
        );
      }
    } else {
      emit(
        ProfileChangePasswordStateType(
          state: ProfileChangePasswordFailedState(),
          error: "Old password doesn't match",
        )
      );
    }
  }
  
}