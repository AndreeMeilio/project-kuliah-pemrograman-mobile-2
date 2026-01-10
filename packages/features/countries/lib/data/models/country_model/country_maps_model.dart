import 'package:countries/domain/entities/country/country_maps.dart';

class CountryMapsModel{
  String? googleMaps;
  String? openStreetMaps;

  CountryMapsModel({
    this.googleMaps,
    this.openStreetMaps
  });

  factory CountryMapsModel.fromJson(Map<String, dynamic> json){
    return CountryMapsModel(
      googleMaps: json["googleMaps"],
      openStreetMaps: json["openStreetMaps"]
    );
  }

  CountryMaps toEntity(){
    return CountryMaps(
      googleMaps: googleMaps,
      openStreetMaps: googleMaps
    );
  }
}