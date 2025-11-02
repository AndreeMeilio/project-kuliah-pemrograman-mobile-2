

import 'package:dio/dio.dart';

class ApiConfig {
  Dio? _dio;
  static ApiConfig? _instance;

  ApiConfig._();

  static ApiConfig getInstance(){
    return _instance ??= ApiConfig._();
  }

  Dio getDio(){
    if (_dio != null) return _dio!;

    _dio = Dio();
    _dio!.options.baseUrl = "https://official-joke-api.appspot.com/";
    _dio!.options.connectTimeout = const Duration(seconds: 5);
    _dio!.options.receiveTimeout = const Duration(seconds: 3);

    return _dio!;
  }

}