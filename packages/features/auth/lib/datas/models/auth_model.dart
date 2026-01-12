// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
    String? username;
    String? password;
    String? token;

    AuthModel({
        this.username,
        this.password,
        this.token,
    });

    factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        username: json["username"],
        password: json["password"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "token": token,
    };
}
