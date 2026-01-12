import 'package:core/core.dart';
import 'package:users/domains/entities/user.dart';
import 'package:users/domains/entities/user_address.dart';
import 'package:users/domains/entities/user_name.dart';

class DeleteUser{
  final UserRepository _repository;
  
  DeleteUser(this._repository);

  Future<GenericModelOrEntityResponse<User>> call({
    required int id
  }) async{
    final deleteDataFromRepository = await _repository.deleteUser(id: id);

    final dataUserResponse = User(
      name: UserName(
        firstname: deleteDataFromRepository.data.name?.firstname,
        lastname: deleteDataFromRepository.data.name?.lastname
      ),
      address: UserAddress(
        city: deleteDataFromRepository.data.address?.city,
        number: deleteDataFromRepository.data.address?.number,
        street: deleteDataFromRepository.data.address?.street,
        zipcode: deleteDataFromRepository.data.address?.zipcode,
        geolocation: Geolocation(
          lat: deleteDataFromRepository.data.address?.geolocation?.lat,
          long: deleteDataFromRepository.data.address?.geolocation?.long,
        )
      ),
      email: deleteDataFromRepository.data.email,
      password: deleteDataFromRepository.data.password,
      phone: deleteDataFromRepository.data.phone,
      username: deleteDataFromRepository.data.username
    );

    return GenericModelOrEntityResponse(
      status: deleteDataFromRepository.status, 
      message: deleteDataFromRepository.message, 
      data: dataUserResponse
    );
  }
}