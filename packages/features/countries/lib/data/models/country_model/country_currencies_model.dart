import 'package:countries/domain/entities/country/country_currencies.dart';

class CountryCurrenciesModel {
  List<CountryCurrenciesModelData>? data; 

  CountryCurrenciesModel({
    this.data
  });

  factory CountryCurrenciesModel.fromJson(Map<String, dynamic> json){
    return CountryCurrenciesModel(
      data: json.entries.map((entry) => CountryCurrenciesModelData(
        key: entry.key,
        name: entry.value["name"],
        symbol: entry.value["symbol"]
      )).toList()
    );
  }

  CountryCurrencies toEntity(){
    return CountryCurrencies(
      data: data?.map((e) => e.toEntity(),).toList() ?? []
    );
  }
}

class CountryCurrenciesModelData {
  String? key;
  String? name;
  String? symbol;

  CountryCurrenciesModelData({
    this.key,
    this.name,
    this.symbol
  });

  CountryCurrenciesData toEntity(){
    return CountryCurrenciesData(
      key: key,
      name: name,
      symbol: symbol
    );
  }
}