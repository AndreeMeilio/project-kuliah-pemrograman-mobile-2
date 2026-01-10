import 'package:countries/domain/entities/country/country_language.dart';

class CountryLanguageModel {
  List<CountryLanguageModelData>? data;

  CountryLanguageModel({
    this.data
  });

  factory CountryLanguageModel.fromJson(Map<String, dynamic> json){
    return CountryLanguageModel(
      data: json.entries.map((entry) => CountryLanguageModelData(
        key: entry.key,
        value: entry.value
      )).toList()
    );
  }

  CountryLanguage toEntity(){
    return CountryLanguage(
      data: data?.map((e) => e.toEntity()).toList() ?? []
    );
  }
}

class CountryLanguageModelData {
  String? key;
  String? value;

  CountryLanguageModelData({
    this.key,
    this.value
  });

  CountryLanguageData toEntity(){
    return CountryLanguageData(
      key: key,
      value: value
    );
  }
}