
import 'package:core/core.dart';
import 'package:users/datas/models/user_model.dart';
import 'package:users/domains/entities/user.dart';

abstract class UserRepository {
  Future<GenericModelOrEntityResponse<List<UserModel>>> getAllUsers({int? limit, String? sort});
  Future<GenericModelOrEntityResponse<UserModel>> getSingleUser({required int id});
  Future<GenericModelOrEntityResponse<UserModel>> createUser({required User data});
  Future<GenericModelOrEntityResponse<UserModel>> updateProduct({required User data, required int id});
  Future<GenericModelOrEntityResponse<UserModel>> deleteProduct({required int id});
} 
  