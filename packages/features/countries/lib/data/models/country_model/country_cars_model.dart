import 'package:countries/domain/entities/country/country_cars.dart';

class CountryCarsModel {
  List<dynamic>? signs;
  String? side;

  CountryCarsModel({
    this.signs,
    this.side
  });

  factory CountryCarsModel.fromJson(Map<String, dynamic> json){
    return CountryCarsModel(
      side: json["side"],
      signs: json["signs"]
    );
  }

  CountryCars toEntity(){
    return CountryCars(
      side: side,
      signs: signs
    );
  }
}