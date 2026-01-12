
import 'package:core/constant/response_code.dart';
import 'package:dio/dio.dart';

class ApiHelperResponse<T>{
  ResponseCodeEnum? status;
  String? message;
  Response<T>? response;
  dynamic data;

  ApiHelperResponse({
    required this.status,
    required this.message,
    required this.response,
    required this.data,
  });

  Map<String, Object?> toJson(){
    return {
      "status": status,
      "message": message,
      "response": response as T,
      "data": data
    };
  }
}