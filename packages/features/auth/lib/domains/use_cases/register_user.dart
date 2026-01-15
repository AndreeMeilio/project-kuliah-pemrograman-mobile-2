
import 'package:core/core.dart';
import 'package:users/users.dart';

class Register {
  final UserRepository _repository;

  Register(this._repository);

  Future<GenericModelOrEntityResponse<User>> call({
    required User user
  }) async{

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