import 'package:auth/presentations/cubits/login_cubit.dart';
import 'package:auth/presentations/states/login_state.dart';
import 'package:core/core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKey;

  late LoginCubit _loginCubit;
  late LoginRememberMeCheckBoxCubit _loginRememberMeCheckBoxCubit;

  @override
  void initState(){
    super.initState();

    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();

    _loginCubit = BlocProvider.of<LoginCubit>(context, listen: false);
    _loginRememberMeCheckBoxCubit = BlocProvider.of<LoginRememberMeCheckBoxCubit>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) async{ 
      final token = await CorePreferences.get<String>(PreferencesKey.tokenLogin);

      if (!mounted) return;

      if (token != null){
        Navigator.pushReplacementNamed(context, AppPageRoutesName.productListPage);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    _usernameController.dispose();
    _passwordController.dispose();

    _loginCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: GenericPage(
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: .stretch,
                children: [
                  Image.asset(
                    CoreAssets.logo,
                    package: 'core',
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.defaultPadding),
                    child: Text(
                      "Login",
                      style: AppTextStyle.kHeading1.get(),
                    ),
                  ),
                  const SizedBox(height: 16.0,),
                  OutlinedTextFieldComponent(
                    label: "Username", 
                    controller: _usernameController,
                    hint: "Insert your username here",
                    validator: (value){
                      if (value == null || value == ""){
                        return "Please insert your username!";
                      }
            
                      return null;
                    },
                  ),
                  const SizedBox(height: 8.0,),
                  OutlinedTextFieldComponent(
                    label: "Password", 
                    controller: _passwordController,
                    isPassword: true,
                    hint: "Insert your password here",
                    validator: (value){
                      if (value == null || value == ""){
                        return "Please insert your password!";
                      }
            
                      return null;
                    },
                  ),
                  const SizedBox(height: 8.0,),
                  BlocBuilder<LoginRememberMeCheckBoxCubit, bool>(
                    builder: (context, state){
                      return Row(
                        children: [
                          Checkbox(
                            activeColor: Theme.of(context).colorScheme.primary,
                            value: state, 
                            onChanged: (value){
                              _loginRememberMeCheckBoxCubit.changeRememberMeValue(value ?? false);
                            }
                          ),
                          Text(
                            "Remember me!",
                            style: AppTextStyle.kBody1.get(),
                          )
                        ],
                      );
                    }
                  ),
                  const SizedBox(height: 16.0,),
                  BlocListener<LoginCubit, LoginGenericState>(
                    listener: (context, state) {
                      if (state.state is LoginLoadingState){
                        loadingComponent(context, show: true);
                      } else if (state.state is LoginSuccessState){
                        loadingComponent(context, show: false);
                        showMessageSnackbar(
                          context: context,
                          message: "Authentication success",
                          type: MessageSnackbarType.success
                        );

                        Navigator.pushReplacementNamed(context, AppPageRoutesName.productListPage);
                      } else if (state.state is LoginFailedState){
                        loadingComponent(context, show: false);
                        showMessageSnackbar(
                          context: context,
                          message: state.error ?? "",
                          type: MessageSnackbarType.error
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: BlocBuilder<LoginRememberMeCheckBoxCubit, bool>(
                        builder: (context, state){
                          return PrimaryButtonComponent(
                            onTap: () async{
                              if (_formKey.currentState?.validate() ?? false){
                                await _loginCubit.login(
                                  username: _usernameController.text, 
                                  password: _passwordController.text,
                                  rememberMe: state
                                );
                              }
                            }, 
                            label: "LOGIN"
                          );
                        },
                      )
                    ),
                  ),
                  const SizedBox(height: 8.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: RichText(
                      text: TextSpan(
                        text: "You don't have an account? ",
                        style: AppTextStyle.kBody1.get().copyWith(
                          color: Theme.of(context).colorScheme.onSurface
                        ),
                        children: [
                          TextSpan(
                            text: "Register Here!",
                            style: AppTextStyle.kBody1.get().copyWith(color: Theme.of(context).colorScheme.primary),
                            recognizer: TapGestureRecognizer()
                              ..onTap = (){
                                Navigator.pushNamed(context, AppPageRoutesName.registerPage);
                              }
                          )
                        ]
                      ),
                    )
                  ),
                  const SizedBox(height: 16.0,)
                ],
              ),
            ),
          )
        ),
      )
    );
  }
}