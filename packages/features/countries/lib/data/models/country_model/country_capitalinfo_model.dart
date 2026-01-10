import 'package:countries/domain/entities/country/country_capitalinfo.dart';

class CountryCapitalInfoModel{
  List<dynamic>? latlng;

  CountryCapitalInfoModel({
    this.latlng
  });

  factory CountryCapitalInfoModel.fromJson(Map<String, dynamic> json){
    return CountryCapitalInfoModel(
      latlng: json["latlng"]
    );
  }

  CountryCapitalInfo toEntity(){
    return CountryCapitalInfo(
      latlng: latlng
    );
  }
}