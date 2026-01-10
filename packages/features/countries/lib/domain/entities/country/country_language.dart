class CountryLanguage {
  List<CountryLanguageData>? data;

  CountryLanguage({
    this.data
  });

  factory CountryLanguage.fromJson(Map<String, dynamic> json){
    return CountryLanguage(
      data: json.entries.map((entry) => CountryLanguageData(
        key: entry.key,
        value: entry.value
      )).toList()
    );
  }
}

class CountryLanguageData {
  String? key;
  String? value;

  CountryLanguageData({
    this.key,
    this.value
  });
}