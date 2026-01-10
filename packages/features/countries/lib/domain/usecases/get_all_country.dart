
import 'package:countries/domain/entities/country/country.dart';
import 'package:countries/domain/repositories/country_repository.dart';

class GetAllCountry {
  final CountryRepository _countryRepository;

  GetAllCountry({
    required CountryRepository countryRepository
  }) : _countryRepository = countryRepository;

  Future<Country> call(){
    final result = _countryRepository.getAll();

    return result;
  }
}