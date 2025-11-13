
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rest_well_aurant/data/core/api_constant.dart';

class ApiConfig {
  static Dio? dio;

  static Dio instance(){
    if (dio != null) return dio!;

    dio = Dio();
    dio!.options.baseUrl = ApiConstant.baseUrl;
    dio!.options.connectTimeout = ApiConstant.connectTimeout;
    dio!.options.receiveTimeout = ApiConstant.receiveTimeout;
    
    dio!.interceptors.add(dioLogger());

    return dio!;
  }

  static PrettyDioLogger dioLogger(){
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    );
  }
}