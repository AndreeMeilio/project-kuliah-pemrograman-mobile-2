

import 'package:core/constant/api.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiConfig {
  Dio? _dio;

  ApiConfig();

  Dio get dio{
    if (_dio != null) return _dio!;

    _dio = Dio();

    _dio!.options.baseUrl = AppApiConfig.baseUrl;
    _dio!.options.receiveTimeout = AppApiConfig.receiveTimeout;
    _dio!.options.connectTimeout = AppApiConfig.connectTimeout; 

    _dio!.interceptors.add(PrettyDioLogger(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      compact: true,
      enabled: true,
      error: true,
    ));

    return _dio!;
  }
}