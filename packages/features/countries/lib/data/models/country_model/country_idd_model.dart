import 'package:countries/domain/entities/country/country_idd.dart';

class CountryIddModel {
  String? root;
  List<dynamic>? suffixes;

  CountryIddModel({
    this.root,
    this.suffixes
  });

  factory CountryIddModel.fromJson(Map<String, dynamic> json){
    return CountryIddModel(
      root: json["root"],
      suffixes: json["suffixes"]
    );
  }

  CountryIdd toEntity(){
    return CountryIdd(
      root: root,
      suffixes: suffixes
    );
  }
}