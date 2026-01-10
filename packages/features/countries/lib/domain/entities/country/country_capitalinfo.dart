class CountryCapitalInfo{
  List<dynamic>? latlng;

  CountryCapitalInfo({
    this.latlng
  });

  factory CountryCapitalInfo.fromJson(Map<String, dynamic> json){
    return CountryCapitalInfo(
      latlng: json["latlng"]
    );
  }
}