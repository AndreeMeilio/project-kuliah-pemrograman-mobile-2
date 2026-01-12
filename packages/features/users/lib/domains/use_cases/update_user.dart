
import 'package:core/core.dart';
import 'package:users/domains/entities/user.dart';
import 'package:users/domains/entities/user_address.dart';
import 'package:users/domains/entities/user_name.dart';

class UpdateUser {
  final UserRepository _repository;

  UpdateUser(
    this._repository
  );

  Future<GenericModelOrEntityResponse<User>> call({
    required int id,
    required User user
  }) async{

    final updateDataFromRepository = await _repository.updateUser(data: user, id: id);

    final dataResponse = User(
      name: UserName(
        firstname: updateDataFromRepository.data.name?.firstname,
        lastname: updateDataFromRepository.data.name?.lastname
      ),
      address: UserAddress(
        city: updateDataFromRepository.data.address?.city,
        number: updateDataFromRepository.data.address?.number,
        street: updateDataFromRepository.data.address?.street,
        zipcode: updateDataFromRepository.data.address?.zipcode,
        geolocation: Geolocation(
          lat: updateDataFromRepository.data.address?.geolocation?.lat,
          long: updateDataFromRepository.data.address?.geolocation?.long,
        )
      ),
      email: updateDataFromRepository.data.email,
      password: updateDataFromRepository.data.password,
      phone: updateDataFromRepository.data.phone,
      username: updateDataFromRepository.data.username
    );
      

    return GenericModelOrEntityResponse(
      status: updateDataFromRepository.status, 
      message: updateDataFromRepository.message, 
      data: dataResponse
    );    
  }
}