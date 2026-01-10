

import 'package:core/utils/locators.dart';
import 'package:countries/data/datasources/remote/country_remote_data_source.dart';
import 'package:countries/data/repositories/country_repository_impl.dart';
import 'package:countries/domain/repositories/country_repository.dart';
import 'package:countries/domain/usecases/get_all_country.dart';

class CountryInjection{
  static void setup(){
    sl.registerLazySingleton<CountryRemoteDataSource>(() => CountryRemoteDataSourceImpl(apiHelper: sl()));
    sl.registerLazySingleton<CountryRepository>(() => CountryRepositoryImpl(countryRemoteDataSource: sl()));
    sl.registerLazySingleton<GetAllCountry>(() => GetAllCountry(countryRepository: sl()));
  }
}