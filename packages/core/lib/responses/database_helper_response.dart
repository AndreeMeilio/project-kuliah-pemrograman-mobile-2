
import 'package:core/constant/response_code.dart';

class DatabaseHelperResponse<T>{
  ResponseCodeEnum? status;
  String? message;
  T? data;

  DatabaseHelperResponse({
    required this.status,
    required this.message,
    required this.data
  });

  Map<String, Object?> toJson(){
    return {
      "status": status,
      "message": message,
      "data": data as T
    };
  }
}