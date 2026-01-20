
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users/domains/entities/user.dart';
import 'package:users/domains/use_cases/get_detail_user.dart';
import 'package:users/presentations/states/profile_state.dart';

typedef ProfileStateType = GenericState<User, ProfileState>;
class ProfileCubit extends Cubit<ProfileStateType>{
  ProfileCubit() : super(ProfileStateType(state: ProfileInitialState()));

  Future<void> getProfileUser() async{
    emit(ProfileStateType(state: ProfileLoadingState()));

    final dataDummy = 1;

    final getDetailUser = sl.get<GetDetailUser>(instanceName: "getDetailUser");
    final dataProfile = await getDetailUser(id: dataDummy);

    if (dataProfile.status == ResponseCodeEnum.success){
      emit(ProfileStateType(
        state: ProfileLoadedState(),
        message: dataProfile.message,
        data: dataProfile.data
      ));
    } else {
      emit(ProfileStateType(
        state: ProfileFailedState(),
        error: dataProfile.message,
      ));
    }
  }
}