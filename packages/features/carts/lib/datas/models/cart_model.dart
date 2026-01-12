// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

import 'package:carts/datas/models/cart_product_detail_model.dart';

List<CartModel> cartModelFromJson(String str) => List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));

String cartModelToJson(List<CartModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartModel {
    int? id;
    int? userId;
    DateTime? date;
    List<CartProductDetailModel>? detailProducts;
    int? v;

    CartModel.empty();
    CartModel({
        this.id,
        this.userId,
        this.date,
        this.detailProducts,
        this.v,
    });

    factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        userId: json["userId"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        detailProducts: json["products"] == null ? [] : List<CartProductDetailModel>.from(json["products"]!.map((x) => CartProductDetailModel.fromJson(x))),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "date": date?.toIso8601String(),
        "products": detailProducts == null ? [] : List<dynamic>.from(detailProducts!.map((x) => x.toJson())),
        "__v": v,
    };
}
