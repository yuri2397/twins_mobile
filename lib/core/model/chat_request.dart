import 'dart:convert';

import 'package:twinz/core/model/user.dart';

ChatRequest chatRequestFromJson(String str) =>
    ChatRequest.fromJson(json.decode(str));

String chatRequestToJson(ChatRequest data) => json.encode(data.toJson());

class ChatRequest {
  int? id;
  User? userFrom;
  User? userInvited;
  String? status;

  ChatRequest({
    this.id,
    this.userFrom,
    this.userInvited,
    this.status,
  });

  factory ChatRequest.fromJson(Map<String, dynamic> json) => ChatRequest(
        id: json["id"],
        userFrom:
            json["user_from"] == null ? null : User.fromJson(json["user_from"]),
        userInvited: json["user_invited"] == null
            ? null
            : User.fromJson(json["user_invited"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_from": userFrom?.toJson(),
        "user_invited": userInvited?.toJson(),
        "status": status,
      };
}
