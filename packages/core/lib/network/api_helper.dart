
import 'package:core/constant/response_code.dart';
import 'package:core/network/api_config.dart';
import 'package:core/responses/api_helper_response.dart';
import 'package:dio/dio.dart';

class ApiHelper {
  final ApiConfig _apiConfig;

  ApiHelper({
    required ApiConfig apiConfig
  }) : _apiConfig = apiConfig;

  Future<ApiHelperResponse> get({
    required String path, 
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _apiConfig.dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress
      );

      final apiResult = ApiHelperResponse(
        status: ResponseCodeEnum.success,
        message: response.statusMessage,
        response: response,
        data: response.data as List? ?? []
      );

      return apiResult;
    } on DioException catch (e){
      return ApiHelperResponse(
        status: ResponseCodeEnum.error,
        message: "Terjadi kesahalan ketika memuat data",
        response: e.response,
        data: e.response?.data ?? []
      );
    }
  }
}