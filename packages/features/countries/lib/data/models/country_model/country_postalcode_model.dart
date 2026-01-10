import 'package:countries/domain/entities/country/country_postalcode.dart';

class CountryPostalCodeModel{
  String? format;
  String? regex;

  CountryPostalCodeModel({
    this.format,
    this.regex
  });

  factory CountryPostalCodeModel.fromJson(Map<String, dynamic>? json){
    return CountryPostalCodeModel(
      format: json?["format"],
      regex: json?["regex"]
    );
  }

  CountryPostalCode toEntity(){
    return CountryPostalCode(
      format: format,
      regex: regex
    );
  }
}