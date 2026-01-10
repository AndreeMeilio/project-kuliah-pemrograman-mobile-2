import 'package:countries/domain/entities/country/country_demonyms.dart';

class CountryDemonymsModel {
  List<CountryDemonymsModelData>? data;

  CountryDemonymsModel({
    this.data
  });

  factory CountryDemonymsModel.fromJson(Map<String, dynamic> json){
    return CountryDemonymsModel(
      data: json.entries.map((entry) => CountryDemonymsModelData(
        key: entry.key,
        f: entry.value["f"],
        m: entry.value["m"] 
      )).toList()
    );
  }

  CountryDemonyms toEntity(){
    return CountryDemonyms(
      data: data?.map((e) => e.toEntity()).toList() ?? []
    );
  }
}

class CountryDemonymsModelData {
  String? key;
  String? f;
  String? m;

  CountryDemonymsModelData({
    this.key,
    this.f,
    this.m
  });

  CountryDemonymsData toEntity(){
    return CountryDemonymsData(
      f: f,
      key: key,
      m: m
    );
  }
}