import 'package:core/core.dart';
import 'package:core/utils/core_assets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKey;

  @override
  void initState(){
    super.initState();

    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    super.dispose();

    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
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
              ),
              const SizedBox(height: 8.0,),
              OutlinedTextFieldComponent(
                label: "Password", 
                controller: _passwordController,
                isPassword: true,
                hint: "Insert your password here",
              ),
              const SizedBox(height: 16.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: PrimaryButtonComponent(
                  onTap: (){
                    
                  }, 
                  label: "LOGIN"
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
        )
      ),
    );
  }
}