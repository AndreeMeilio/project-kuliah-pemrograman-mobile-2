
import 'package:core/core.dart';
import 'package:core/domain/user_repository.dart';
import 'package:users/domains/entities/user.dart';
import 'package:users/domains/entities/user_address.dart';
import 'package:users/domains/entities/user_name.dart';

class GetAllUserFilter{
  final UserRepository _repository;
  final int? limit;
  final String? sort;
  
  GetAllUserFilter(this._repository, {
    this.limit,
    this.sort,
  });

  Future<GenericModelOrEntityResponse<List<User>>> call() async{
    final dataFromRepository = await _repository.getAllUsers(
      limit: limit,
      sort: sort,
    );

    final List<User> dataUserResponse = dataFromRepository.data.map((userModel){
      return User(
        name: UserName(
          firstname: userModel.name?.firstname,
          lastname: userModel.name?.lastname
        ),
        address: UserAddress(
          city: userModel.address?.city,
          number: userModel.address?.number,
          street: userModel.address?.street,
          zipcode: userModel.address?.zipcode,
          geolocation: Geolocation(
            lat: userModel.address?.geolocation?.lat,
            long: userModel.address?.geolocation?.long,
          )
        ),
        email: userModel.email,
        password: userModel.password,
        phone: userModel.phone,
        username: userModel.username
      );
    }).toList();

    return GenericModelOrEntityResponse(
      status: dataFromRepository.status, 
      message: dataFromRepository.message, 
      data: dataUserResponse
    );
  }
}