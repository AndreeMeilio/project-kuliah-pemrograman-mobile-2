import 'package:auth/auth.dart';
import 'package:auth/presentations/states/register_state.dart';
import 'package:core/core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  late GlobalKey<FormState> _formKey;
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameControler;
  late TextEditingController _phoneController;
  late TextEditingController _cityController;
  late TextEditingController _latController;
  late TextEditingController _longitudeController;
  late TextEditingController _streetController;
  late TextEditingController _numberController;
  late TextEditingController _zipController;

  late RegisterPasswordValidationCubit _registerPasswordValidationCubit;
  late RegisterCubit _registerCubit;

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();

    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameControler = TextEditingController();
    _phoneController = TextEditingController();
    _cityController = TextEditingController();
    _latController = TextEditingController();
    _longitudeController = TextEditingController();
    _streetController = TextEditingController();
    _numberController = TextEditingController();
    _zipController = TextEditingController();

    _registerPasswordValidationCubit = BlocProvider.of<RegisterPasswordValidationCubit>(context, listen: false);
    _registerCubit = BlocProvider.of<RegisterCubit>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();

    _usernameController.dispose();
    _firstNameController.dispose();
    _emailController.dispose();
    _lastNameControler.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    _latController.dispose();
    _longitudeController.dispose();
    _streetController.dispose();
    _numberController.dispose();
    _zipController.dispose();

    _registerPasswordValidationCubit.resetPasswordValidation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: GenericPage(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: Form(
              key: _formKey,
              child: CustomScrollView(
                physics: BouncingScrollPhysics(),
                slivers: [
                  SliverList.list(
                    children: [
                      const SizedBox(height: 8.0,),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                          child: Text(
                          "Register Account",
                          style: AppTextStyle.kHeading1.get(),
                        ),
                      ),
                      const SizedBox(height: 8.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "Account Information *",
                          style: AppTextStyle.kHeading3.get(),
                        ),
                      ),
                      const SizedBox(height: 8.0,),
                      OutlinedTextFieldComponent(
                        label: "Username *", 
                        controller: _usernameController,
                        hint: "Insert your username here!",
                        validator: (value){
                          if(value == null || value == ""){
                            return "Please insert your username!";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8.0,),
                      OutlinedTextFieldComponent(
                        label: "Password *", 
                        controller: _passwordController,
                        hint: "Insert your Password here!",
                        isPassword: true,
                        onChanged: (value){
                          if (RegExp(r'^(?=.*[a-z]).{1,}$').hasMatch(value)){
                            _registerPasswordValidationCubit.updateStateHasLowercase(true);
                          } else {
                            _registerPasswordValidationCubit.updateStateHasLowercase(false);
                          }

                          if (RegExp(r'^(?=.*[A-Z]).{1,}$').hasMatch(value)){
                            _registerPasswordValidationCubit.updateStateHasUppercase(true);
                          } else {
                            _registerPasswordValidationCubit.updateStateHasUppercase(false);
                          }

                          if (RegExp(r'^(?=.*\d).{1,}$').hasMatch(value)){
                            _registerPasswordValidationCubit.updateStateHasNumeric(true);
                          } else {
                            _registerPasswordValidationCubit.updateStateHasNumeric(false);
                          }
                          
                          if (RegExp(r'^(?=.*[^A-Za-z0-9]).{1,}$').hasMatch(value)){
                            _registerPasswordValidationCubit.updateStateHasSymbol(true);
                          } else {
                            _registerPasswordValidationCubit.updateStateHasSymbol(false);
                          }

                          if (value.length >= 8){
                            _registerPasswordValidationCubit.updateStateHasMinLength(true);
                          } else {
                            _registerPasswordValidationCubit.updateStateHasMinLength(false);
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
                      BlocBuilder<RegisterPasswordValidationCubit, RegisterPasswordValidationType>(
                        builder: (context, state) {
                          return ActiveCheckComponent(
                            isActive: state.hasMinLength,
                            text: "Password must have at least 8 characters.",
                          );
                        },
                      ),
                      const SizedBox(height: 8.0,),
                      BlocBuilder<RegisterPasswordValidationCubit, RegisterPasswordValidationType>(
                        builder: (context, state){
                          return ActiveCheckComponent(
                            isActive: state.hasLowercase,
                            text: "Password must have at least 1 lowercase.",
                          );
                        },
                      ),
                      const SizedBox(height: 8.0,),
                      BlocBuilder<RegisterPasswordValidationCubit, RegisterPasswordValidationType>(
                        builder: (context, state){
                          return ActiveCheckComponent(
                            isActive: state.hasUppercase,
                            text: "Password must have at least 1 uppercase.",
                          );
                        },
                      ),
                      const SizedBox(height: 8.0,),
                      BlocBuilder<RegisterPasswordValidationCubit, RegisterPasswordValidationType>(
                        builder: (context, state){
                          return ActiveCheckComponent(
                            isActive: state.hasNumeric,
                            text: "Password must have at least 1 number.",
                          );
                        },
                      ),
                      const SizedBox(height: 8.0,),
                      BlocBuilder<RegisterPasswordValidationCubit, RegisterPasswordValidationType>(
                        builder: (context, state){
                          return ActiveCheckComponent(
                            isActive: state.hasSymbol,
                            text: "Password must have at least 1 symbol.",
                          );
                        },
                      ),
                      const SizedBox(height: 8.0,),

                    ],
                  ),
                  SliverList.list(
                    children: [
                      const SizedBox(height: 8.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "Personal Information *",
                          style: AppTextStyle.kHeading3.get(),
                        ),
                      ),
                      const SizedBox(height: 8.0,),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedTextFieldComponent(
                              label: "First Name *", 
                              controller: _firstNameController,
                              hint: "Insert your firstname here!",
                              validator: (value){

                                if (value == null || value == ""){
                                  return "Please insert your firstname!";
                                }

                                return null;
                              },
                            ),
                          ),
                          Expanded(
                            child: OutlinedTextFieldComponent(
                              label: "Last Name *", 
                              controller: _lastNameControler,
                              hint: "Insert your lastname here!",
                              validator: (value){
                                if (value == null || value == ""){
                                  return "Please insert your lastname!";
                                }

                                return null;
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 8.0,),
                      OutlinedTextFieldComponent(
                        label: "Email *", 
                        controller: _emailController,
                        hint: "Insert your Email here!",
                        textInputType: TextInputType.emailAddress,
                        validator: (value){
                          if (value == null || value == ""){
                            return "Please insert your email!";
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 8.0,),
                      OutlinedTextFieldComponent(
                        label: "Phone *", 
                        controller: _phoneController,
                        hint: "Insert your Phone here!",
                        textInputType: TextInputType.phone,
                        validator: (value){
                          if (value == null || value == ""){
                            return "Please insert your phone!";
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 8.0,),
                    ],
                  ),
                  SliverList.list(
                    children: [
                      const SizedBox(height: 8.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          "Address Information",
                          style: AppTextStyle.kHeading3.get(),
                        ),
                      ),
                      const SizedBox(height: 8.0,),
                      OutlinedTextFieldComponent(
                        label: "City", 
                        controller: _cityController,
                      ),
                      const SizedBox(height: 8.0,),
                      OutlinedTextFieldComponent.textArea(
                        label: "Street", 
                        controller: _streetController,
                        maxLines: 4,
                      ),
                      const SizedBox(height: 8.0,),
                      OutlinedTextFieldComponent(
                        label: "Number", 
                        controller: _numberController,
                        textInputType: TextInputType.number,
                      ),
                      const SizedBox(height: 8.0,),
                      OutlinedTextFieldComponent(
                        label: "Zip Code", 
                        controller: _zipController,
                        textInputType: TextInputType.number,
                      ),
                      const SizedBox(height: 8.0,),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedTextFieldComponent(
                              label: "Langitude", 
                              controller: _latController,
                              textInputType: TextInputType.numberWithOptions(decimal: true),
                            ),
                          ),
                          Expanded(
                            child: OutlinedTextFieldComponent(
                              label: "Longitude", 
                              controller: _longitudeController,
                              textInputType: TextInputType.numberWithOptions(decimal: true),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 8.0,)
                    ],
                  ),
                  SliverList.list(
                    children: [
                      const SizedBox(height: 8.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: BlocListener<RegisterCubit, RegisterStateType>(
                          listener: (context, state){
                            if (state.state is RegisterLoadingState){
                              loadingComponent(context, show: true);
                            } else if (state.state is RegisterSuccessState){
                              loadingComponent(context, show: false);
                              showMessageSnackbar(
                                context: context,
                                message: "Registration user success",
                                type: MessageSnackbarType.success
                              );

                              Navigator.pop(context);
                            } else if (state.state is RegisterFailedState){
                              loadingComponent(context, show: false);
                              showMessageSnackbar(
                                context: context,
                                message: state.error ?? "",
                                type: MessageSnackbarType.error
                              );
                            }
                          },
                          child: PrimaryButtonComponent(
                            onTap: () async{
                              if (_formKey.currentState?.validate() ?? false){
                                _registerCubit.registerUser(
                                  username: _usernameController.text, 
                                  email: _emailController.text, 
                                  password: _passwordController.text, 
                                  firstName: _firstNameController.text, 
                                  lastname: _lastNameControler.text, 
                                  phone: _phoneController.text,
                                  city: _cityController.text,
                                  number: _numberController.text,
                                  street: _streetController.text,
                                  latitude: _latController.text,
                                  longitude: _longitudeController.text,
                                  zip: _zipController.text
                                );
                              }
                            }, 
                            label: "REGISTER"
                          ),
                        )
                      ),
                      const SizedBox(height: 8.0,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: RichText(
                          text: TextSpan(
                            text: "You already have an account? ",
                            style: AppTextStyle.kBody1.get().copyWith(
                              color: Theme.of(context).colorScheme.onSurface
                            ),
                            children: [
                              TextSpan(
                                text: "Login Here!",
                                style: AppTextStyle.kBody1.get().copyWith(color: Theme.of(context).colorScheme.primary),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = (){
                                    Navigator.pop(context);
                                  }
                              )
                            ]
                          ),
                        )
                      ),
                      const SizedBox(height: 8.0,),

                    ],
                  )
                ],
              ),
            ),
          )
        ),
      )
    );
  }
}