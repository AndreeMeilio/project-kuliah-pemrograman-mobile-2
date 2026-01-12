
import 'package:core/constant/response_code.dart';
import 'package:core/network/api_config.dart';
import 'package:core/responses/api_helper_response.dart';
import 'package:dio/dio.dart';

enum ApiHelperMethod {
  get,
  post,
  put,
  delete
}

class ApiHelper {
  final ApiConfig _apiConfig;

  ApiHelper({
    required ApiConfig apiConfig
  }) : _apiConfig = apiConfig;

  Future<ApiHelperResponse> call({
    required String path, 
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    ApiHelperMethod? method = ApiHelperMethod.get
  }) async {
    try {
      late Response response;

      switch(method){
        case ApiHelperMethod.get:
          response = await _apiConfig.dio.get(
            path,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress
          );
        case ApiHelperMethod.post:
          response = await _apiConfig.dio.post(
            path,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress
          );
        case ApiHelperMethod.put:
          response = await _apiConfig.dio.put(
            path,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress
          );
        case ApiHelperMethod.delete:
          response = await _apiConfig.dio.delete(
            path,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
          );
        default:
          response = await _apiConfig.dio.get(
            path,
            data: data,
            queryParameters: queryParameters,
            options: options,
            cancelToken: cancelToken,
            onReceiveProgress: onReceiveProgress
          );
      }

      final apiResult = ApiHelperResponse(
        status: ResponseCodeEnum.success,
        message: response.statusMessage,
        response: response,
        data: data
      );

      return apiResult;
    } on DioException catch (e){
      return ApiHelperResponse(
        status: ResponseCodeEnum.error,
        message: e.response?.data["message"] ?? "There is a mistake, please try again",
        response: e.response,
        data: data ?? []
      );
    }
  }
}