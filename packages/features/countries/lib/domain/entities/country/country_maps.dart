class CountryMaps{
  String? googleMaps;
  String? openStreetMaps;

  CountryMaps({
    this.googleMaps,
    this.openStreetMaps
  });

  factory CountryMaps.fromJson(Map<String, dynamic> json){
    return CountryMaps(
      googleMaps: json["googleMaps"],
      openStreetMaps: json["openStreetMaps"]
    );
  }
}