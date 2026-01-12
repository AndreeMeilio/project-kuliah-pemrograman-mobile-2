
sealed class LoginState{}
class LoginInitState extends LoginState{}
class LoginLoadingState extends LoginState{}
class LoginSuccessState extends LoginState{}
class LoginFailedState extends LoginState{}
