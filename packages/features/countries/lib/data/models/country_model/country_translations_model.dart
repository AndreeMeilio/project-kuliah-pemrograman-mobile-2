import 'package:countries/domain/entities/country/country_translations.dart';

class CountryTranslationsModel{
  List<CountryTranslationsModelData>? data;

  CountryTranslationsModel({
    this.data
  });

  factory CountryTranslationsModel.fromJson(Map<String, dynamic> json){
    return CountryTranslationsModel(
      data: json.entries.map((entry) => CountryTranslationsModelData(
        key: entry.key,
        official: entry.value["official"],
        common: entry.value["common"]
      )).toList()
    );
  }

  CountryTranslations toEntity(){
    return CountryTranslations(
      data: data?.map((e) => e.toEntity()).toList()
    );
  }
}

class CountryTranslationsModelData {
  String? key;
  String? official;
  String? common;

  CountryTranslationsModelData({
    this.key,
    this.official,
    this.common
  });

  CountryTranslationsData toEntity(){
    return CountryTranslationsData(
      key: key,
      official: official,
      common: common
    );
  }
}