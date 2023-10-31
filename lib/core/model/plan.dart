// To parse this JSON data, do
//
//     final plan = planFromJson(jsonString);

import 'dart:convert';

List<Plan> planFromJson(String str) => List<Plan>.from(json.decode(str).map((x) => Plan.fromJson(x)));

String planToJson(List<Plan> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Plan {
  int? id;
  dynamic name;
  String? description;
  String? price;
  String? duration;
  bool selected = false;

  Plan({
    this.id,
    this.name,
    this.description,
    this.price,
    this.duration,
    this.selected = false
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    duration: json["duration"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "price": price,
    "duration": duration,
  };
}
