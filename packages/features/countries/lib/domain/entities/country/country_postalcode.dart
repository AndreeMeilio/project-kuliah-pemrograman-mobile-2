class CountryPostalCode{
  String? format;
  String? regex;

  CountryPostalCode({
    this.format,
    this.regex
  });

  factory CountryPostalCode.fromJson(Map<String, dynamic>? json){
    return CountryPostalCode(
      format: json?["format"],
      regex: json?["regex"]
    );
  }
}