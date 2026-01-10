
import 'package:countries/domain/entities/country/country.dart';

abstract class CountryRepository {
  Future<Country> getAll();
}