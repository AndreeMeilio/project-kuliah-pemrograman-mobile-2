class CountryCurrencies {
  List<CountryCurrenciesData>? data; 

  CountryCurrencies({
    this.data
  });

  factory CountryCurrencies.fromJson(Map<String, dynamic> json){
    return CountryCurrencies(
      data: json.entries.map((entry) => CountryCurrenciesData(
        key: entry.key,
        name: entry.value["name"],
        symbol: entry.value["symbol"]
      )).toList()
    );
  }
}

class CountryCurrenciesData {
  String? key;
  String? name;
  String? symbol;

  CountryCurrenciesData({
    this.key,
    this.name,
    this.symbol
  });
}