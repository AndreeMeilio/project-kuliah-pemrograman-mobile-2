class CountryFlags {
  String? png;
  String? svg;
  String? alt;

  CountryFlags({
    this.png,
    this.svg,
    this.alt
  });

  factory CountryFlags.fromJson(Map<String, dynamic> json){
    return CountryFlags(
      alt: json["alt"],
      png: json["png"],
      svg: json["svg"]
    );
  }
}