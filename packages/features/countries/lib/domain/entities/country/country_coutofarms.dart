class CountryCoatOfArms {
  String? png;
  String? svg;
  String? alt;

  CountryCoatOfArms({
    this.png,
    this.svg,
    this.alt
  });

  factory CountryCoatOfArms.fromJson(Map<String, dynamic> json){
    return CountryCoatOfArms(
      alt: json["alt"],
      png: json["png"],
      svg: json["svg"]
    );
  }
}