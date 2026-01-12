// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:users/datas/models/user_address_model.dart';
import 'package:users/datas/models/user_name_model.dart';

List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
    UserAddressModel? address;
    int? id;
    String? email;
    String? username;
    String? password;
    UserNameModel? name;
    String? phone;
    int? v;

    UserModel.empty();

    UserModel({
        this.address,
        this.id,
        this.email,
        this.username,
        this.password,
        this.name,
        this.phone,
        this.v,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        address: json["address"] == null ? null : UserAddressModel.fromJson(json["address"]),
        id: json["id"],
        email: json["email"],
        username: json["username"],
        password: json["password"],
        name: json["name"] == null ? null : UserNameModel.fromJson(json["name"]),
        phone: json["phone"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "address": address?.toJson(),
        "id": id,
        "email": email,
        "username": username,
        "password": password,
        "name": name?.toJson(),
        "phone": phone,
        "__v": v,
    };
}
