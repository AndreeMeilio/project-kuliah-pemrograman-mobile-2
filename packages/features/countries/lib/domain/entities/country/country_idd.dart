class CountryIdd {
  String? root;
  List<dynamic>? suffixes;

  CountryIdd({
    this.root,
    this.suffixes
  });

  factory CountryIdd.fromJson(Map<String, dynamic> json){
    return CountryIdd(
      root: json["root"],
      suffixes: json["suffixes"]
    );
  }
}