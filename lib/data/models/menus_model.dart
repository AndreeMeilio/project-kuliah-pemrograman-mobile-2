import 'package:rest_well_aurant/data/models/category_model.dart';

class Menus {
  List<Category>? foods;
  List<Category>? drinks;

  Menus({this.foods, this.drinks});

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
    foods: json["foods"] == null
        ? []
        : List<Category>.from(json["foods"]!.map((x) => Category.fromJson(x))),
    drinks: json["drinks"] == null
        ? []
        : List<Category>.from(json["drinks"]!.map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "foods": foods == null
        ? []
        : List<dynamic>.from(foods!.map((x) => x.toJson())),
    "drinks": drinks == null
        ? []
        : List<dynamic>.from(drinks!.map((x) => x.toJson())),
  };
}
