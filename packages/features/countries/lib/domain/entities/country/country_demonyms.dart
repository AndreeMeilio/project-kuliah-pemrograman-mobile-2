class CountryDemonyms {
  List<CountryDemonymsData>? data;

  CountryDemonyms({
    this.data
  });

  factory CountryDemonyms.fromJson(Map<String, dynamic> json){
    return CountryDemonyms(
      data: json.entries.map((entry) => CountryDemonymsData(
        key: entry.key,
        f: entry.value["f"],
        m: entry.value["m"] 
      )).toList()
    );
  }
}

class CountryDemonymsData {
  String? key;
  String? f;
  String? m;

  CountryDemonymsData({
    this.key,
    this.f,
    this.m
  });
}