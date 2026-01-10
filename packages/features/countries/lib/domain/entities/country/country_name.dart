import 'dart:ffi';

class CountryName {
    String? common;
    String? official;
    NativeName? nativeName;

    CountryName({
        this.common,
        this.official,
        this.nativeName,
    });

    factory CountryName.fromJson(Map<String, dynamic> json){
      return CountryName(
        common: json["common"],
        official: json["official"],
        nativeName: NativeName.fromJson(json["nativeName"] ?? {})
      );
    }
}

class NativeName {
  List<NativeNameData>? data;

  NativeName({
    this.data
  });

  factory NativeName.fromJson(Map<String, dynamic> json){
    return NativeName(
      data: json.isNotEmpty
        ? json.entries.map((entry){
          return NativeNameData(
            key: entry.key,
            official: entry.value["official"],
            common: entry.value["common"]
          );
        }).toList()
        : []
    );
  }
}

class NativeNameData {
  String? key;
  String? official;
  String? common;

  NativeNameData({
    this.key,
    this.official,
    this.common
  });
}
