
import 'package:core/constant/response_code.dart';
import 'package:countries/data/models/country_model/country_capitalinfo_model.dart';
import 'package:countries/data/models/country_model/country_cars_model.dart';
import 'package:countries/data/models/country_model/country_coutofarms_model.dart';
import 'package:countries/data/models/country_model/country_currencies_model.dart';
import 'package:countries/data/models/country_model/country_demonyms_model.dart';
import 'package:countries/data/models/country_model/country_flags_model.dart';
import 'package:countries/data/models/country_model/country_idd_model.dart';
import 'package:countries/data/models/country_model/country_language_model.dart';
import 'package:countries/data/models/country_model/country_maps_model.dart';
import 'package:countries/data/models/country_model/country_name_model.dart';
import 'package:countries/data/models/country_model/country_postalcode_model.dart';
import 'package:countries/data/models/country_model/country_translations_model.dart';
import 'package:countries/domain/entities/country/country.dart';
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

class CountryModel {
  ResponseCodeEnum? statusCode;
  String? message;
  List<CountryModelData>? data;

  CountryModel({
    this.statusCode,
    this.message,
    this.data
  });

  factory CountryModel.fromJson(Map<String, dynamic> json){
    return CountryModel(
      statusCode: json["status"],
      message: json["message"],
      data: (json["data"] as List?)?.isNotEmpty ?? false
        ? (json["data"] as List?)!.map((element) => CountryModelData.fromJson(element)).toList()
        : []
    );
  }

  Country toEntity(){
    return Country(
      statusCode: statusCode ?? ResponseCodeEnum.notidentified,
      message: "",
      data: data?.map((e) => e.toEntity()).toList() ?? []
    );
  }
}

class CountryModelData {
  CountryNameModel? countryName;
  List<dynamic>? tld;
  String? cca2;
  String? ccn3;
  String? cca3;
  bool? independent;
  String? status;
  bool? unMember;
  CountryCurrenciesModel? currencies;
  CountryIddModel? idd;
  List<dynamic>? capital;
  List<dynamic>? altSpellings;
  String? region;
  String? subRegion;
  CountryLanguageModel? language;
  CountryTranslationsModel? translations;
  List<dynamic>? latlng;
  bool? landlocked;
  double? area;
  List<dynamic>? borders;
  CountryDemonymsModel? demonyms;
  String? flag;
  CountryMapsModel? maps;
  int? population;
  String? fifa;
  CountryCarsModel? cars;
  List<dynamic>? timezones;
  List<dynamic>? continents;
  CountryFlagsModel? flags;
  CountryCoatOfArmsModel? coatOfArms;
  String? startOfWeek;
  CountryCapitalInfoModel? capitalInfo;
  CountryPostalCodeModel? postalCode;

  CountryModelData({
    this.countryName,
    this.tld,
    this.cca2,
    this.cca3,
    this.ccn3,
    this.independent,
    this.status,
    this.unMember,
    this.currencies,
    this.idd,
    this.capital,
    this.altSpellings,
    this.region,
    this.subRegion,
    this.language,
    this.translations,
    this.latlng,
    this.landlocked,
    this.area,
    this.borders,
    this.demonyms,
    this.flag,
    this.maps,
    this.population,
    this.fifa,
    this.cars,
    this.continents,
    this.timezones,
    this.flags,
    this.coatOfArms,
    this.capitalInfo,
    this.startOfWeek,
    this.postalCode
  });

  factory CountryModelData.fromJson(Map<String, dynamic> json){
    return CountryModelData(
      countryName : CountryNameModel.fromJson(json["name"]),
      tld : json["tld"],
      cca2 : json["cca2"],
      cca3 : json["cca3"],
      ccn3 : json["ccn3"],
      independent : json["independent"],
      status : json["status"],
      unMember : json["unMember"],
      currencies : CountryCurrenciesModel.fromJson(json["currencies"] ?? {}),
      idd : CountryIddModel.fromJson(json["idd"] ?? {}),
      capital : json["capital"],
      altSpellings : json["altSpellings"],
      region : json["region"],
      subRegion: json["subregion"],
      language : CountryLanguageModel.fromJson(json["languages"] ?? {}),
      translations : CountryTranslationsModel.fromJson(json["translations"] ?? {}),
      latlng : json["latlng"],
      landlocked : json["landlocked"],
      area : json["area"],
      borders : json["borders"],
      demonyms : CountryDemonymsModel.fromJson(json["demonyms"] ?? {}),
      flag : json["flag"],
      maps : CountryMapsModel.fromJson(json["maps"] ?? {}),
      population : json["population"],
      fifa: json["fifa"],
      cars : CountryCarsModel.fromJson(json["car"] ?? {}),
      continents : json["continents"],
      timezones : json["timezones"],
      flags : CountryFlagsModel.fromJson(json["flags"] ?? {}),
      coatOfArms : CountryCoatOfArmsModel.fromJson(json["coatOfArms"] ?? {}),
      capitalInfo : CountryCapitalInfoModel.fromJson(json["capitalInfo"] ?? {}),
      startOfWeek: json["startOfWeek"],
      postalCode: CountryPostalCodeModel.fromJson(json["postalCode"] ?? {})
    );
  }

  CountryData toEntity(){
    return CountryData(
      area: area ?? 0,
      altSpellings: altSpellings ?? [],
      borders: borders ?? [],
      capital: capital ?? [],
      capitalInfo: capitalInfo?.toEntity() ?? CountryCapitalInfo(),
      cars: cars?.toEntity() ?? CountryCars(),
      cca2: cca2 ?? "",
      cca3: cca3 ?? "",
      ccn3: ccn3 ?? "",
      coatOfArms: coatOfArms?.toEntity() ?? CountryCoatOfArms(),
      continents: continents ?? [],
      countryName: countryName?.toEntity() ?? CountryName(),
      currencies: currencies?.toEntity() ?? CountryCurrencies(),
      demonyms: demonyms?.toEntity() ?? CountryDemonyms(),
      fifa: fifa ?? "",
      flag: flag ?? "",
      flags: flags?.toEntity() ?? CountryFlags(),
      idd: idd?.toEntity() ?? CountryIdd(),
      independent: independent,
      landlocked: landlocked,
      language: language?.toEntity() ?? CountryLanguage(),
      latlng: latlng ?? [],
      maps: maps?.toEntity() ?? CountryMaps(),
      population: population ?? -1,
      postalCode: postalCode?.toEntity() ?? CountryPostalCode(),
      region: region ?? "",
      startOfWeek: startOfWeek ?? "",
      status: status ?? "",
      subRegion: subRegion ?? "",
      timezones: timezones ?? [],
      tld: tld ?? [],
      translations: translations?.toEntity() ?? CountryTranslations(),
      unMember: unMember 
    );
  }
}


