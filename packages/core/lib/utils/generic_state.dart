import 'package:core/constant/response_code.dart';

class GenericState<T, K>{
  ResponseCodeEnum? status;
  String? message;
  T? data;
  String? error;
  K? state;

  GenericState({
    this.state,
    this.data,
    this.error,
    this.message,
    this.status
  });
}