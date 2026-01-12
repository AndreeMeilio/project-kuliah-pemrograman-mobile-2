
import 'package:core/core.dart';
import 'package:core/domain/user_repository.dart';
import 'package:users/domains/entities/user.dart';
import 'package:users/domains/entities/user_address.dart';
import 'package:users/domains/entities/user_name.dart';

class GetDetailUser{
  final UserRepository _repository;
  final int id;
  
  GetDetailUser(this._repository, {required this.id});

  Future<GenericModelOrEntityResponse<User>> call() async{
    final dataFromRepository = await _repository.getSingleUser(id: id);

    final User dataUserResponse = User(
      name: UserName(
        firstname: dataFromRepository.data.name?.firstname,
        lastname: dataFromRepository.data.name?.lastname
      ),
      address: UserAddress(
        city: dataFromRepository.data.address?.city,
        number: dataFromRepository.data.address?.number,
        street: dataFromRepository.data.address?.street,
        zipcode: dataFromRepository.data.address?.zipcode,
        geolocation: Geolocation(
          lat: dataFromRepository.data.address?.geolocation?.lat,
          long: dataFromRepository.data.address?.geolocation?.long,
        )
      ),
      email: dataFromRepository.data.email,
      password: dataFromRepository.data.password,
      phone: dataFromRepository.data.phone,
      username: dataFromRepository.data.username
    );

    return GenericModelOrEntityResponse(
      status: dataFromRepository.status, 
      message: dataFromRepository.message, 
      data: dataUserResponse
    );
  }
}