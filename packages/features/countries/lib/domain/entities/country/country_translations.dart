class CountryTranslations{
  List<CountryTranslationsData>? data;

  CountryTranslations({
    this.data
  });

  factory CountryTranslations.fromJson(Map<String, dynamic> json){
    return CountryTranslations(
      data: json.entries.map((entry) => CountryTranslationsData(
        key: entry.key,
        official: entry.value["official"],
        common: entry.value["common"]
      )).toList()
    );
  }
}

class CountryTranslationsData {
  String? key;
  String? official;
  String? common;

  CountryTranslationsData({
    this.key,
    this.official,
    this.common
  });
}