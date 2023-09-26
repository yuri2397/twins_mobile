// To parse this JSON data, do
//
//     final chat = chatFromJson(jsonString);

import 'dart:convert';

import 'package:twins/core/model/user.dart';

Chat chatFromJson(String str) => Chat.fromJson(json.decode(str));

String chatToJson(Chat data) => json.encode(data.toJson());

class Chat {
  int? id;
  DateTime? createdAt;
  List<User>? participants;
  List<Message>? messages;

  Chat({
    this.id,
    this.createdAt,
    this.participants,
    this.messages,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
    id: json["id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    participants: json["participants"] == null ? [] : List<User>.from(json["participants"]!.map((x) => User.fromJson(x))),
    messages: json["messages"] == null ? [] : List<Message>.from(json["messages"]!.map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt?.toIso8601String(),
    "participants": participants == null ? [] : List<dynamic>.from(participants!.map((x) => x.toJson())),
    "messages": messages == null ? [] : List<dynamic>.from(messages!.map((x) => x.toJson())),
  };
}

class Message {
  int? id;
  String? message;
  String? chatId;
  String? userId;
  Data? data;
  DateTime? createdAt;
  User? sender;

  Message({
    this.id,
    this.message,
    this.chatId,
    this.userId,
    this.data,
    this.createdAt,
    this.sender,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["id"],
    message: json["message"],
    chatId: json["chat_id"],
    userId: json["user_id"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    sender: json["sender"] == null ? null : User.fromJson(json["sender"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "message": message,
    "chat_id": chatId,
    "user_id": userId,
    "data": data?.toJson(),
    "created_at": createdAt?.toIso8601String(),
    "sender": sender?.toJson(),
  };

  Map<String, dynamic> toJsonForMessage() => {
    "id": id.toString(),
    "text": message,
    "chat_id": chatId,
    "user_id": userId,
    "type": "text",
    "data": data?.toJson(),
    "status": "sending",
    "showStatus": true,
    "updateAt": DateTime.timestamp(),
    "created_at": createdAt?.toIso8601String(),
    "author": sender?.toJsonForMessage(),
  };
}

class Data {
  List<dynamic>? seenBy;
  String? status;

  Data({
    this.seenBy,
    this.status,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    seenBy: json["seenBy"] == null ? [] : List<dynamic>.from(json["seenBy"]!.map((x) => x)),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "seenBy": seenBy == null ? [] : List<dynamic>.from(seenBy!.map((x) => x)),
    "status": status,
  };
}