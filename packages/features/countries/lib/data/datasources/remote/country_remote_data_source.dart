
import 'package:core/constant/api_routes.dart';
import 'package:core/constant/response_code.dart';
import 'package:core/network/api_helper.dart';
import 'package:core/responses/api_helper_response.dart';
import 'package:countries/data/models/country_model/country_model.dart';
import 'package:dio/dio.dart';

abstract class CountryRemoteDataSource {
  Future<CountryModel> getAllCountry();
}

class CountryRemoteDataSourceImpl extends CountryRemoteDataSource{

  final ApiHelper _apiHelper;

  CountryRemoteDataSourceImpl({required ApiHelper apiHelper}) : _apiHelper = apiHelper;

  @override
  Future<CountryModel> getAllCountry() async{
    try {
      final ApiHelperResponse result = await _apiHelper.get(path: AppApiRoute.allCountry);

      return CountryModel.fromJson(result.toJson());
    } on DioException catch (e){
      return CountryModel(
        statusCode: ResponseCodeEnum.error,
        message: "Terjadi kesalahan ketika memuat data",
        data: []
      );
    }
  }

}