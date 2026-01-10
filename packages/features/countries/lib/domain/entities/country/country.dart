
import 'package:core/constant/response_code.dart';
import 'package:countries/domain/entities/country/country_capitalinfo.dart';
import 'package:countries/domain/entities/country/country_cars.dart';
import 'package:countries/domain/entities/country/country_coutofarms.dart';
import 'package:countries/domain/entities/country/country_currencies.dart';
import 'package:countries/domain/entities/country/country_demonyms.dart';
import 'package:countries/domain/entities/country/country_flags.dart';
import 'package:countries/domain/entities/country/country_idd.dart';
import 'package:countries/domain/entities/country/country_language.dart';
import 'package:countries/domain/entities/country/country_maps.dart';
import 'package:countries/domain/entities/country/country_name.dart';
import 'package:countries/domain/entities/country/country_postalcode.dart';
import 'package:countries/domain/entities/country/country_translations.dart';

class Country {
  ResponseCodeEnum statusCode;
  String message;
  List<CountryData> data;

  Country({
    required this.statusCode,
    required this.message,
    required this.data
  });

  factory Country.fromJson(Map<String, dynamic> json){
    return Country(
      statusCode: json["status"],
      message: json["message"],
      data: (json["data"] as List?)?.isNotEmpty ?? false
        ? (json["data"] as List?)!.map((element) => CountryData.fromJson(element)).toList()
        : []
    );
  }
}

class CountryData {
  CountryName countryName;
  List<dynamic> tld;
  String cca2;
  String ccn3;
  String cca3;
  bool? independent;
  String status;
  bool? unMember;
  CountryCurrencies currencies;
  CountryIdd idd;
  List<dynamic> capital;
  List<dynamic> altSpellings;
  String region;
  String subRegion;
  CountryLanguage language;
  CountryTranslations translations;
  List<dynamic> latlng;
  bool? landlocked;
  double area;
  List<dynamic> borders;
  CountryDemonyms demonyms;
  String flag;
  CountryMaps maps;
  int population;
  String fifa;
  CountryCars cars;
  List<dynamic> timezones;
  List<dynamic> continents;
  CountryFlags flags;
  CountryCoatOfArms coatOfArms;
  String startOfWeek;
  CountryCapitalInfo capitalInfo;
  CountryPostalCode postalCode;

  CountryData({
    required this.countryName,
    required this.tld,
    required this.cca2,
    required this.cca3,
    required this.ccn3,
    required this.independent,
    required this.status,
    required this.unMember,
    required this.currencies,
    required this.idd,
    required this.capital,
    required this.altSpellings,
    required this.region,
    required this.subRegion,
    required this.language,
    required this.translations,
    required this.latlng,
    required this.landlocked,
    required this.area,
    required this.borders,
    required this.demonyms,
    required this.flag,
    required this.maps,
    required this.population,
    required this.fifa,
    required this.cars,
    required this.continents,
    required this.timezones,
    required this.flags,
    required this.coatOfArms,
    required this.capitalInfo,
    required this.startOfWeek,
    required this.postalCode
  });

  factory CountryData.fromJson(Map<String, dynamic> json){
    return CountryData(
      countryName : CountryName.fromJson(json["name"]),
      tld : json["tld"],
      cca2 : json["cca2"],
      cca3 : json["cca3"],
      ccn3 : json["ccn3"],
      independent : json["independent"],
      status : json["status"],
      unMember : json["unMember"],
      currencies : CountryCurrencies.fromJson(json["currencies"] ?? {}),
      idd : CountryIdd.fromJson(json["idd"] ?? {}),
      capital : json["capital"],
      altSpellings : json["altSpellings"],
      region : json["region"],
      subRegion: json["subregion"],
      language : CountryLanguage.fromJson(json["languages"] ?? {}),
      translations : CountryTranslations.fromJson(json["translations"] ?? {}),
      latlng : json["latlng"],
      landlocked : json["landlocked"],
      area : json["area"],
      borders : json["borders"],
      demonyms : CountryDemonyms.fromJson(json["demonyms"] ?? {}),
      flag : json["flag"],
      maps : CountryMaps.fromJson(json["maps"] ?? {}),
      population : json["population"],
      fifa: json["fifa"],
      cars : CountryCars.fromJson(json["car"] ?? {}),
      continents : json["continents"],
      timezones : json["timezones"],
      flags : CountryFlags.fromJson(json["flags"] ?? {}),
      coatOfArms : CountryCoatOfArms.fromJson(json["coatOfArms"] ?? {}),
      capitalInfo : CountryCapitalInfo.fromJson(json["capitalInfo"] ?? {}),
      startOfWeek: json["startOfWeek"],
      postalCode: CountryPostalCode.fromJson(json["postalCode"] ?? {})
    );
  }
}


