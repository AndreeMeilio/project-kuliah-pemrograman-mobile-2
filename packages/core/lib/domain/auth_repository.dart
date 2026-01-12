
import 'package:auth/auth.dart';
import 'package:core/core.dart';

abstract class AuthRepository {
  Future<GenericModelOrEntityResponse<AuthModel>> login({required Auth data});
}