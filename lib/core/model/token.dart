// To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

import 'dart:convert';

import 'package:twins/core/model/user.dart';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token data) => json.encode(data.toJson());

class Token {
  User? user;
  String? accessToken;
  String? tokenType;

  Token({
    this.user,
    this.accessToken,
    this.tokenType,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        accessToken: json["access_token"],
        tokenType: json["token_type"],
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "access_token": accessToken,
        "token_type": tokenType,
      };
}
