import 'package:countries/domain/entities/country/country_flags.dart';

class CountryFlagsModel {
  String? png;
  String? svg;
  String? alt;

  CountryFlagsModel({
    this.png,
    this.svg,
    this.alt
  });

  factory CountryFlagsModel.fromJson(Map<String, dynamic> json){
    return CountryFlagsModel(
      alt: json["alt"],
      png: json["png"],
      svg: json["svg"]
    );
  }

  CountryFlags toEntity(){
    return CountryFlags(
      alt: alt,
      png: png,
      svg: svg
    );
  }
}