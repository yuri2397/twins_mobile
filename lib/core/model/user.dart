import 'dart:convert';

import 'package:twins/core/model/setting.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? fullName;
  String? email;
  bool? emailVerified;
  String? gender;
  double? lat;
  double? lng;
  String? phoneNumber;
  DateTime? birthDate;
  int? age;
  String? bio;
  Setting? settings;

  User({
    this.fullName,
    this.email,
    this.emailVerified,
    this.gender,
    this.lat,
    this.lng,
    this.phoneNumber,
    this.birthDate,
    this.age,
    this.bio,
    this.settings,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        fullName: json["full_name"],
        email: json["email"],
        emailVerified: json["email_verified"],
        gender: json["gender"],
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
        phoneNumber: json["phone_number"],
        birthDate: json["birth_date"] == null
            ? null
            : DateTime.parse(json["birth_date"]),
        age: json["age"],
        bio: json["bio"],
        settings: json["settings"] == null
            ? null
            : Setting.fromJson(json["settings"]),
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "email": email,
        "email_verified": emailVerified,
        "gender": gender,
        "lat": lat,
        "lng": lng,
        "phone_number": phoneNumber,
        "birth_date": birthDate?.toIso8601String(),
        "age": age,
        "bio": bio,
        "settings": settings?.toJson(),
      };
}
