import 'dart:convert';

Setting settingFromJson(String str) => Setting.fromJson(json.decode(str));

String settingToJson(Setting data) => json.encode(data.toJson());

class Setting {
  int? distanceInKilometers;
  int? differenceInDays;
  int? ageMin;
  int? ageMax;
  String? gender;

  Setting({
    this.distanceInKilometers,
    this.differenceInDays,
    this.ageMin,
    this.ageMax,
    this.gender,
  });

  factory Setting.fromJson(Map<String, dynamic> json) => Setting(
        distanceInKilometers: json["distance_in_kilometers"],
        differenceInDays: json["difference_in_days"],
        ageMin: json["age_min"],
        ageMax: json["age_max"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "distance_in_kilometers": distanceInKilometers,
        "difference_in_days": differenceInDays,
        "age_min": ageMin,
        "age_max": ageMax,
        "gender": gender,
      };
}
