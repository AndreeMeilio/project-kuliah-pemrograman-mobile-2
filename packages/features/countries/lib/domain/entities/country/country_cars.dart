class CountryCars {
  List<dynamic>? signs;
  String? side;

  CountryCars({
    this.signs,
    this.side
  });

  factory CountryCars.fromJson(Map<String, dynamic> json){
    return CountryCars(
      side: json["side"],
      signs: json["signs"]
    );
  }
}