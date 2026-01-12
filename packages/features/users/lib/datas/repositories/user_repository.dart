
import 'dart:convert';

import 'package:core/core.dart';
import 'package:users/datas/data_sources/remote_data_source.dart';
import 'package:users/datas/models/user_address_model.dart';
import 'package:users/datas/models/user_model.dart';
import 'package:users/datas/models/user_name_model.dart';
import 'package:users/domains/entities/user.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource _remoteDataSource;

  UserRepositoryImpl(this._remoteDataSource);

  @override
  Future<GenericModelOrEntityResponse<UserModel>> createUser({required User data}) async{
    var dataUserRequest = UserModel(
      name: UserNameModel(
        firstname: data.name?.firstname,
        lastname: data.name?.lastname
      ),
      address: UserAddressModel(
        city: data.address?.city,
        number: data.address?.number,
        street: data.address?.street,
        zipcode: data.address?.zipcode,
        geolocation: GeolocationModel(
          lat: data.address?.geolocation?.lat,
          long: data.address?.geolocation?.long,
        )
      ),
      email: data.email,
      password: data.password,
      phone: data.phone,
      username: data.username,
      v: 1
    );
    final dataSource = await _remoteDataSource.createUser(data: dataUserRequest);

    if (dataSource.response?.data case Map<String, dynamic> dataResponse when dataSource.status == ResponseCodeEnum.success){
      dataUserRequest.id = dataResponse["id"];
    } else {
      dataUserRequest.id = 0;
    }

    return GenericModelOrEntityResponse<UserModel>(
      status: dataSource.status!, 
      message: dataSource.message ?? "", 
      data: dataUserRequest
    );
  }

  @override
  Future<GenericModelOrEntityResponse<UserModel>> deleteUser({required int id}) async{
    final dataSource = await _remoteDataSource.deleteUser(id: id);

    late UserModel dataFinal;
    if (dataSource.response?.data case Map<String, dynamic> dataResponse when dataSource.status == ResponseCodeEnum.success){
      dataFinal = UserModel.fromJson(dataResponse);
    } else {
      dataFinal = UserModel.empty();
    }

    return GenericModelOrEntityResponse<UserModel>(
      status: dataSource.status!, 
      message: dataSource.message ?? "", 
      data: dataFinal
    );
  }

  @override
  Future<GenericModelOrEntityResponse<List<UserModel>>> getAllUsers({int? limit, String? sort}) async{
    final dataSource = await _remoteDataSource.getAllUsers(
      limit: limit,
      sort: sort
    );

    List<UserModel> dataProduct = [];
    
    if (dataSource.response?.data case List dataResponse! when dataSource.status == ResponseCodeEnum.success){
      dataProduct = userModelFromJson(jsonEncode(dataResponse));
    }

    return GenericModelOrEntityResponse<List<UserModel>>(
      status: dataSource.status!, 
      message: dataSource.message ?? "", 
      data: dataProduct
    );
  }

  @override
  Future<GenericModelOrEntityResponse<UserModel>> getSingleUser({required int id}) async{
    final dataSource = await _remoteDataSource.getSingleUser(
      id: id
    );

    late UserModel dataProduct;
    
    if (dataSource.response?.data case Map<String, dynamic> dataResponse! when dataSource.status == ResponseCodeEnum.success){
      dataProduct = UserModel.fromJson(dataResponse);
    } else {
      dataProduct = UserModel.empty();
    }

    return GenericModelOrEntityResponse<UserModel>(
      status: dataSource.status!, 
      message: dataSource.message ?? "", 
      data: dataProduct
    );
  }

  @override
  Future<GenericModelOrEntityResponse<UserModel>> updateUser({required User data, required int id}) async{
    final dataUserRequest = UserModel(
      name: UserNameModel(
        firstname: data.name?.firstname,
        lastname: data.name?.lastname
      ),
      address: UserAddressModel(
        city: data.address?.city,
        number: data.address?.number,
        street: data.address?.street,
        zipcode: data.address?.zipcode,
        geolocation: GeolocationModel(
          lat: data.address?.geolocation?.lat,
          long: data.address?.geolocation?.long,
        )
      ),
      email: data.email,
      password: data.password,
      phone: data.phone,
      username: data.username
    );
    final dataSource = await _remoteDataSource.updateUser(
      id: id,
      data: dataUserRequest
    );

    late UserModel dataUser;

    if (dataSource.response?.data case Map<String, dynamic> dataResponse when dataSource.status == ResponseCodeEnum.success){
      dataUser = UserModel.fromJson(dataResponse);
    } else {
      dataUser = UserModel.empty();
    }

    return GenericModelOrEntityResponse<UserModel>(
      status: dataSource.status!, 
      message: dataSource.message ?? "", 
      data: dataUser
    );
  }

}