
sealed class RegisterState{}
class RegisterInitState extends RegisterState{}
class RegisterLoadingState extends RegisterState{}
class RegisterSuccessState extends RegisterState{}
class RegisterFailedState extends RegisterState{}
