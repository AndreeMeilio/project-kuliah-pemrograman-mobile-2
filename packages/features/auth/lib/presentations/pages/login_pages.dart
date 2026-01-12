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

  @override
  void initState(){
    super.initState();

    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();

    _loginCubit = BlocProvider.of<LoginCubit>(context, listen: false);
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
      body: SafeArea(
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
                const SizedBox(height: 16.0,),
                BlocListener<LoginCubit, LoginGenericState>(
                  listener: (context, state) {
                    if (state.state is LoginLoadingState){
                      print("loading");
                    } else if (state.state is LoginSuccessState){
                      print(state.data?.token);
                    } else if (state.state is LoginFailedState){
                      print(state.error);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: PrimaryButtonComponent(
                      onTap: () async{
                        if (_formKey.currentState?.validate() ?? false){
                          await _loginCubit.login(
                            username: _usernameController.text, 
                            password: _passwordController.text
                          );
                        }
                      }, 
                      label: "LOGIN"
                    ),
                  ),
                ),
                const SizedBox(height: 16.0,),
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
                              print("Register Click");
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
    );
  }
}