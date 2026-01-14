import 'package:core/core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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

  // PASSWORD CHECKER STATE
  late bool passwordMinimum;
  late bool passwordNumber;
  late bool passwordLowercase;
  late bool passwordUppercase;
  late bool passwordSymbol;

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

    passwordMinimum = false;
    passwordNumber = false;
    passwordLowercase = false;
    passwordUppercase = false;
    passwordSymbol = false;
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

    passwordMinimum = false;
    passwordNumber = false;
    passwordLowercase = false;
    passwordUppercase = false;
    passwordSymbol = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
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
                        print("test");
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
                          setState(() {
                            passwordLowercase = true;
                          });
                        }
                        if (RegExp(r'^(?=.*[A-Z]).{1,}$').hasMatch(value)){
                          setState(() {
                            passwordUppercase = true;
                          });
                        }
                        if (RegExp(r'^(?=.*\d).{1,}$').hasMatch(value)){
                          setState(() {
                            passwordNumber = true;
                          });
                        }
                        if (RegExp(r'^(?=.*[^A-Za-z0-9]).{1,}$').hasMatch(value)){
                          setState(() {
                            passwordSymbol = true;
                          });
                        }
                        if (value.length >= 8){
                          setState(() {
                            passwordMinimum = true;
                          });
                        }
                      },
                      validator: (value){
                        print("test");

                        if (value == null || value == ""){
                          return "Please insert your password!";
                        } else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z0-9]).{8,}$').hasMatch(value)){
                          return "Please create a password according to the provisions";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 8.0,),
                    ActiveCheckComponent(
                      isActive: passwordMinimum,
                      text: "Password must have at least 8 characters.",
                    ),
                    const SizedBox(height: 8.0,),
                    ActiveCheckComponent(
                      isActive: passwordLowercase,
                      text: "Password must have at least 1 lowercase.",
                    ),
                    const SizedBox(height: 8.0,),
                    ActiveCheckComponent(
                      isActive: passwordUppercase,
                      text: "Password must have at least 1 uppercase.",
                    ),
                    const SizedBox(height: 8.0,),
                    ActiveCheckComponent(
                      isActive: passwordNumber,
                      text: "Password must have at least 1 number.",
                    ),
                    const SizedBox(height: 8.0,),
                    ActiveCheckComponent(
                      isActive: passwordSymbol,
                      text: "Password must have at least 1 symbol.s",
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
                              print("test");

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
                      child: PrimaryButtonComponent(
                        onTap: () async{
                          if (_formKey.currentState?.validate() ?? false){
                            
                          }
                        }, 
                        label: "REGISTER"
                      ),
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
    );
  }
}