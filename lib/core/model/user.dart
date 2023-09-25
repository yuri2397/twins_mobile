import 'dart:convert';

import 'package:twins/core/model/setting.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int? id;
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
  String? profilePhoto;
  String? address;

  User(
      {this.id,
        this.fullName,
      this.email,
      this.emailVerified,
      this.gender,
      this.lat,
      this.lng,
      this.phoneNumber,
      this.birthDate,
        this.address,
      this.age,
      this.bio,
      this.settings,
      this.profilePhoto});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        fullName: json["full_name"],
        email: json["email"],
        emailVerified: json["email_verified"],
    gender: json["gender"],
    address: json["address"],
        profilePhoto: json["profile_photo"],
        lat: double.tryParse(json["lat"] ?? '0xFF'),
        lng: double.tryParse(json["lng"] ?? '0xFF'),
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
    "id": id,
        "full_name": fullName,
        "email": email,
        "email_verified": emailVerified,
        "gender": gender,
        "profile_photo": profilePhoto,
        "lat": lat.toString(),
        "lng": lng.toString(),
        "phone_number": phoneNumber,
        "birth_date": birthDate?.toIso8601String(),
        "age": age,
        "bio": bio,
        "settings": settings?.toJson(),
      };
}
