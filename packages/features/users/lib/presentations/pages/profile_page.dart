import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users/presentations/states/profile_change_password_state.dart';
import 'package:users/users.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  late ProfileCubit _profileCubit;
  late ProfileChangePasswordCubit _profileChangePasswordCubit;
  late ProfileChangePasswordValidationCubit _profileChangePasswordValidationCubit;

  late TextEditingController _oldPassword;
  late TextEditingController _newPassword;
  late TextEditingController _confirmPassword;

  late GlobalKey<FormState> _formKeyChangePassword;

  @override
  void initState(){
    super.initState();

    _profileCubit = BlocProvider.of<ProfileCubit>(context, listen: false);
    _profileChangePasswordValidationCubit = BlocProvider.of<ProfileChangePasswordValidationCubit>(context, listen: false);
    _profileChangePasswordCubit = BlocProvider.of<ProfileChangePasswordCubit>(context, listen: false);

    _oldPassword = TextEditingController();
    _newPassword = TextEditingController();
    _confirmPassword = TextEditingController();

    _formKeyChangePassword = GlobalKey<FormState>();

    WidgetsBinding.instance.addPostFrameCallback((_){
      _profileCubit.getProfileUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: GenericPage(
        child: SafeArea(
          child: BlocConsumer<ProfileCubit, ProfileStateType>(
            builder: (context, state){
              if (state.state is ProfileFailedState){
                return Center(
                  child: Text(
                    state.message ?? "",
                    style: AppTextStyle.kBody1.get(),
                  ),
                );
              } else if (state.state is ProfileLoadedState){
                return Form(
                  key: _formKeyChangePassword,
                  child: CustomScrollView(
                    slivers: [
                      SliverList.list(
                        children: [
                          Row(
                            mainAxisAlignment: .spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  "Profile",
                                  style: AppTextStyle.kHeading1.get(),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                                child: PrimaryButtonComponent(
                                  buttonColor: Theme.of(context).colorScheme.error,
                                  labelColor: Theme.of(context).colorScheme.onPrimary,
                                  onTap: () async{
                                    await CorePreferences.remove(
                                      PreferencesKey.tokenLogin
                                    );

                                    if (!mounted) return;

                                    Navigator.pushReplacementNamed(context, AppPageRoutesName.loginPage);
                                  }, 
                                  label: "Logout"
                                ),
                              )
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              "Account Information",
                              style: AppTextStyle.kHeading2.get(),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ProfileDataWidget(
                                  label: "Email",
                                  value: state.data?.email ?? "",
                                ),
                              ),
                              Expanded(
                                child: ProfileDataWidget(
                                  label: "Username",
                                  value: state.data?.username ?? "",
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ProfileDataWidget(
                                  label: "First Name",
                                  value: state.data?.name?.firstname ?? "",
                                ),
                              ),
                              Expanded(
                                child: ProfileDataWidget(
                                  label: "Last Name",
                                  value: state.data?.name?.lastname ?? "",
                                ),
                              ),
                            ],
                          ),
                          ProfileDataWidget(
                            label: "Phone",
                            value: state.data?.phone ?? "",
                          ),
                          const SizedBox(height: 16.0,),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              "Address Information",
                              style: AppTextStyle.kHeading2.get(),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ProfileDataWidget(
                                  label: "City",
                                  value: state.data?.address?.city ?? "",
                                ),
                              ),
                              Expanded(
                                child: ProfileDataWidget(
                                  label: "Street",
                                  value: state.data?.address?.street ?? "",
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ProfileDataWidget(
                                  label: "Number",
                                  value: state.data?.address?.number.toString() ?? "",
                                ),
                              ),
                              Expanded(
                                child: ProfileDataWidget(
                                  label: "Zip Code",
                                  value: state.data?.address?.zipcode ?? "",
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ProfileDataWidget(
                                  label: "Latitude",
                                  value: state.data?.address?.geolocation?.lat ?? "",
                                ),
                              ),
                              Expanded(
                                child: ProfileDataWidget(
                                  label: "Longitude",
                                  value: state.data?.address?.geolocation?.long ?? "",
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16.0,),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              "Reset Password",
                              style: AppTextStyle.kHeading2.get(),
                            ),
                          ),
                          const SizedBox(height: 12.0,),
                  
                          OutlinedTextFieldComponent(
                            label: "Old Password *", 
                            controller: _oldPassword,
                            hint: "Insert your old password here!",
                            isPassword: true,
                            validator: (value){
                              if (value?.isEmpty ?? true){
                                return "Please insert your old password!";
                              }
                            },
                          ),
                          const SizedBox(height: 12.0,),
                  
                          OutlinedTextFieldComponent(
                            label: "New Password *", 
                            controller: _newPassword,
                            hint: "Insert your new password here!",
                            isPassword: true,
                            onChanged: (value){
                              if (RegExp(r'^(?=.*[a-z]).{1,}$').hasMatch(value)){
                                _profileChangePasswordValidationCubit.updateStateHasLowercase(true);
                              } else {
                                _profileChangePasswordValidationCubit.updateStateHasLowercase(false);
                              }
                  
                              if (RegExp(r'^(?=.*[A-Z]).{1,}$').hasMatch(value)){
                                _profileChangePasswordValidationCubit.updateStateHasUppercase(true);
                              } else {
                                _profileChangePasswordValidationCubit.updateStateHasUppercase(false);
                              }
                  
                              if (RegExp(r'^(?=.*\d).{1,}$').hasMatch(value)){
                                _profileChangePasswordValidationCubit.updateStateHasNumeric(true);
                              } else {
                                _profileChangePasswordValidationCubit.updateStateHasNumeric(false);
                              }
                              
                              if (RegExp(r'^(?=.*[^A-Za-z0-9]).{1,}$').hasMatch(value)){
                                _profileChangePasswordValidationCubit.updateStateHasSymbol(true);
                              } else {
                                _profileChangePasswordValidationCubit.updateStateHasSymbol(false);
                              }
                  
                              if (value.length >= 8){
                                _profileChangePasswordValidationCubit.updateStateHasMinLength(true);
                              } else {
                                _profileChangePasswordValidationCubit.updateStateHasMinLength(false);
                              }
                            },
                            validator: (value){
                              if (value == null || value == ""){
                                return "Please insert your password!";
                              } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z0-9]).{8,}$').hasMatch(value)){
                                return "Please create a password according to the provisions";
                              }
                  
                              return null;
                            },
                          ),
                          const SizedBox(height: 8.0,),
                          BlocBuilder<ProfileChangePasswordValidationCubit, ProfileChangePasswordValidationType>(
                            builder: (context, state){
                              return ActiveCheckComponent(
                                isActive: state.hasLowercase,
                                text: "Password must have at least 1 lowercase.",
                              );
                            },
                          ),
                          const SizedBox(height: 8.0,),
                          BlocBuilder<ProfileChangePasswordValidationCubit, ProfileChangePasswordValidationType>(
                            builder: (context, state){
                              return ActiveCheckComponent(
                                isActive: state.hasUppercase,
                                text: "Password must have at least 1 uppercase.",
                              );
                            },
                          ),
                          const SizedBox(height: 8.0,),
                          BlocBuilder<ProfileChangePasswordValidationCubit, ProfileChangePasswordValidationType>(
                            builder: (context, state){
                              return ActiveCheckComponent(
                                isActive: state.hasNumeric,
                                text: "Password must have at least 1 number.",
                              );
                            },
                          ),
                          const SizedBox(height: 8.0,),
                          BlocBuilder<ProfileChangePasswordValidationCubit, ProfileChangePasswordValidationType>(
                            builder: (context, state){
                              return ActiveCheckComponent(
                                isActive: state.hasSymbol,
                                text: "Password must have at least 1 symbol.",
                              );
                            },
                          ),
                          const SizedBox(height: 12.0,),
                  
                          OutlinedTextFieldComponent(
                            label: "Confirm New Password *", 
                            controller: _confirmPassword,
                            hint: "Insert confirmation password here!",
                            isPassword: true,
                            validator: (value){
                              if (value != _newPassword.text){
                                return "Confirm password doesn't match with your new password";
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: 16.0,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: BlocListener<ProfileChangePasswordCubit, ProfileChangePasswordStateType>(
                              listener: (context, state){
                                if (state.state is ProfileChangePasswordLoadingState){
                                  loadingComponent(context, show: true);
                                } else if (state.state is ProfileChangePasswordFailedState){
                                  loadingComponent(context, show: false);
                                  showMessageSnackbar(
                                    context: context, 
                                    type: MessageSnackbarType.error, 
                                    message: state.error ?? ""
                                  );
                                } else if (state.state is ProfileChangePasswordSuccessState){
                                  loadingComponent(context, show: false);
                                  showMessageSnackbar(
                                    context: context, 
                                    type: MessageSnackbarType.success, 
                                    message: "Change password success"
                                  );
                                }
                              },
                              child: PrimaryButtonComponent(
                                onTap: () async{
                                  if (_formKeyChangePassword.currentState?.validate() ?? false){
                                    await _profileChangePasswordCubit.changePassword(
                                      user: state.data ?? User.empty(), 
                                      newPassword: _newPassword.text, 
                                      oldPassword: _oldPassword.text
                                    );
                                  }
                                }, 
                                label: "Reset Password"
                              ),
                            )
                          )
                        ],
                      )
                    ],
                  ),
                );
              } else {
                return SizedBox();
              }
            }, 
            listener: (context, state){
              if (state.state is ProfileLoadingState){
                loadingComponent(context, show: true);
              } else {
                loadingComponent(context, show: false);
              }
            } 
          ),
        ),
      ),
    );
  }
}

class ProfileDataWidget extends StatelessWidget {
  const ProfileDataWidget({
    super.key,
    required this.label,
    required this.value
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: .stretch,
        spacing: 4.0,
        children: [
          Text(
            label,
            style: AppTextStyle.kBody1.get(),
          ),
          Text(
            value,
            style: AppTextStyle.kBody1.get().copyWith(
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}