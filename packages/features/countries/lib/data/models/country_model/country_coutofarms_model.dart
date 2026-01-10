import 'package:countries/domain/entities/country/country_coutofarms.dart';

class CountryCoatOfArmsModel {
  String? png;
  String? svg;
  String? alt;

  CountryCoatOfArmsModel({
    this.png,
    this.svg,
    this.alt
  });

  factory CountryCoatOfArmsModel.fromJson(Map<String, dynamic> json){
    return CountryCoatOfArmsModel(
      alt: json["alt"],
      png: json["png"],
      svg: json["svg"]
    );
  }

  CountryCoatOfArms toEntity(){
    return CountryCoatOfArms(
      alt: alt,
      png: png,
      svg: svg
    );
  }
}