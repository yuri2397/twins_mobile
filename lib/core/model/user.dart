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
  String? address;
  String? phoneNumber;
  DateTime? birthDate;
  int? age;
  dynamic bio;
  String? lat;
  String? lng;
  String? profilePhoto;
  int? photosCount;
  Setting? settings;

  User({
    this.id,
    this.fullName,
    this.email,
    this.emailVerified,
    this.gender,
    this.address,
    this.phoneNumber,
    this.birthDate,
    this.age,
    this.bio,
    this.lat,
    this.lng,
    this.profilePhoto,
    this.photosCount,
    this.settings,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        emailVerified: json["email_verified"],
        gender: json["gender"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        birthDate: json["birth_date"] == null
            ? null
            : DateTime.parse(json["birth_date"]),
        age: json["age"],
        bio: json["bio"],
        lat: json["lat"],
        lng: json["lng"],
        profilePhoto: json["profile_photo"],
        photosCount: json["photos_count"],
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
        "address": address,
        "phone_number": phoneNumber,
        "birth_date": birthDate?.toIso8601String(),
        "age": age,
        "bio": bio,
        "lat": lat,
        "lng": lng,
        "profile_photo": profilePhoto,
        "photos_count": photosCount,
        "settings": settings?.toJson(),
      };

  Map<String, dynamic> toJsonForMessage() =>
      {"id": id.toString(), "imageUrl": profilePhoto};
}
