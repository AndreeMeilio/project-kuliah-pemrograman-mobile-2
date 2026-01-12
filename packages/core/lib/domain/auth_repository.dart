
import 'package:auth/datas/models/auth_model.dart';
import 'package:auth/domains/entities/auth.dart';
import 'package:core/core.dart';

abstract class AuthRepository {
  Future<GenericModelOrEntityResponse<AuthModel>> login({required Auth data});
}