
import 'package:core/constant/response_code.dart';
import 'package:countries/data/datasources/remote/country_remote_data_source.dart';
import 'package:countries/domain/entities/country/country.dart';
import 'package:countries/domain/repositories/country_repository.dart';

class CountryRepositoryImpl extends CountryRepository{

  final CountryRemoteDataSource _countryRemoteDataSource;

  CountryRepositoryImpl({
    required CountryRemoteDataSource countryRemoteDataSource
  }) : _countryRemoteDataSource = countryRemoteDataSource;

  @override
  Future<Country> getAll() async{
    try {
      final result = await _countryRemoteDataSource.getAllCountry();

      return Country(
        statusCode: result.statusCode ?? ResponseCodeEnum.notidentified,
        message: result.message ?? "",
        data: result.data?.map((e) => e.toEntity()).toList() ?? <CountryData>[]
      );
    } catch (e){
      return Country(
        statusCode: ResponseCodeEnum.error,
        message: "Terjadi kesalahan saat memuat data",
        data: []
      );
    }
  }

}