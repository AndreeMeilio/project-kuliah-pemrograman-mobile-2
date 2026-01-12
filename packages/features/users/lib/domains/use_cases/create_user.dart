
import 'package:core/core.dart';
import 'package:core/domain/user_repository.dart';
import 'package:users/domains/entities/user.dart';
import 'package:users/domains/entities/user_address.dart';
import 'package:users/domains/entities/user_name.dart';

class CreateUser {
  final UserRepository _repository;
  final User user;

  CreateUser(
    this._repository,
    {required this.user}
  );

  Future<GenericModelOrEntityResponse<User>> call() async{

    final createDataFromRepository = await _repository.createUser(data: user);

    final dataResponse = User(
      name: UserName(
        firstname: createDataFromRepository.data.name?.firstname,
        lastname: createDataFromRepository.data.name?.lastname
      ),
      address: UserAddress(
        city: createDataFromRepository.data.address?.city,
        number: createDataFromRepository.data.address?.number,
        street: createDataFromRepository.data.address?.street,
        zipcode: createDataFromRepository.data.address?.zipcode,
        geolocation: Geolocation(
          lat: createDataFromRepository.data.address?.geolocation?.lat,
          long: createDataFromRepository.data.address?.geolocation?.long,
        )
      ),
      email: createDataFromRepository.data.email,
      password: createDataFromRepository.data.password,
      phone: createDataFromRepository.data.phone,
      username: createDataFromRepository.data.username
    );
      

    return GenericModelOrEntityResponse(
      status: createDataFromRepository.status, 
      message: createDataFromRepository.message, 
      data: dataResponse
    );    
  }
}