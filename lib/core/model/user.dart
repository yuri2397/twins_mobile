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
  int? distance;
  String? phoneNumber;
  DateTime? birthDate;
  int? age;
  bool? isPremium;
  String? bio;
  String? lat;
  String? lng;
  String? profilePhoto;
  int? photosCount;
  Setting? settings;
  List<Photo>? photos;

  User(
      {this.id,
      this.fullName,
      this.email,
      this.emailVerified,
      this.gender,
      this.address,
      this.isPremium,
      this.distance,
      this.lat,
      this.lng,
      this.phoneNumber,
      this.birthDate,
      this.age,
      this.bio,
      this.profilePhoto,
      this.photosCount,
      this.settings,
      this.photos});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        fullName: json["full_name"],
        email: json["email"],
        lat: json['lat'],
        lng: json['lng'],
        emailVerified: json["email_verified"],
        gender: json["gender"],
        address: json["address"],
        isPremium: json['is_premium'],
        distance: json["distance"],
        phoneNumber: json["phone_number"],
        birthDate: json["birth_date"] == null
            ? null
            : DateTime.parse(json["birth_date"]),
        age: json["age"],
        bio: json["bio"],
        profilePhoto: json["profile_photo"],
        photosCount: json["photos_count"],
        settings: json["settings"] == null
            ? null
            : Setting.fromJson(json["settings"]),
        photos: json["photos"] == null
            ? []
            : List<Photo>.from(json["photos"]!.map((x) => Photo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "email": email,
        "email_verified": emailVerified,
        "gender": gender,
        'lng': lng,
        'lat': lat,
        'is_premium': isPremium,
        "address": address,
        "distance": distance,
        "phone_number": phoneNumber,
        "birth_date": birthDate?.toIso8601String(),
        "age": age,
        "bio": bio,
        "profile_photo": profilePhoto,
        "photos_count": photosCount,
        "settings": settings?.toJson(),
        "photos": photos == null
            ? []
            : List<dynamic>.from(photos!.map((x) => x.toJson())),
      };

  Map<String, dynamic> toJsonForMessage() =>
      {"id": id.toString(), "imageUrl": profilePhoto};
}

class Photo {
  int? id;
  String? url;

  Photo({
    this.id,
    this.url,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
      };
}
