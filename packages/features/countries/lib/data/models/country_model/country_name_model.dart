import 'dart:ffi';

import 'package:countries/domain/entities/country/country_name.dart';

class CountryNameModel {
    String? common;
    String? official;
    NativeNameModel? nativeName;

    CountryNameModel({
        this.common,
        this.official,
        this.nativeName,
    });

    factory CountryNameModel.fromJson(Map<String, dynamic> json){
      return CountryNameModel(
        common: json["common"],
        official: json["official"],
        nativeName: NativeNameModel.fromJson(json["nativeName"] ?? {})
      );
    }

    CountryName toEntity(){
      return CountryName(
        common: common,
        official: official,
        nativeName: nativeName?.toEntity() ?? NativeName()
      );
    }
}

class NativeNameModel {
  List<NativeNameModelData>? data;

  NativeNameModel({
    this.data
  });

  factory NativeNameModel.fromJson(Map<String, dynamic> json){
    return NativeNameModel(
      data: json.isNotEmpty
        ? json.entries.map((entry){
          return NativeNameModelData(
            key: entry.key,
            official: entry.value["official"],
            common: entry.value["common"]
          );
        }).toList()
        : []
    );
  }

  NativeName toEntity(){
    return NativeName(
      data: data?.map((e) => e.toEntity()).toList() ?? []
    );
  }
}

class NativeNameModelData {
  String? key;
  String? official;
  String? common;

  NativeNameModelData({
    this.key,
    this.official,
    this.common
  });
  
  NativeNameData toEntity(){
    return NativeNameData(
      common: common,
      key: key,
      official: official
    );
  }
}
