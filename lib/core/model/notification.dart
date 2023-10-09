// To parse this JSON data, do
//
//     final notification = notificationFromJson(jsonString);

import 'dart:convert';

List<Notification> notificationFromJson(String str) => List<Notification>.from(
    json.decode(str).map((x) => Notification.fromJson(x)));

String notificationToJson(List<Notification> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Notification {
  String? id;
  String? type;
  String? notifiableType;
  String? notifiableId;
  NotificationData? data;
  dynamic readAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  Notification({
    this.id,
    this.type,
    this.notifiableType,
    this.notifiableId,
    this.data,
    this.readAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        id: json["id"],
        type: json["type"],
        notifiableType: json["notifiable_type"],
        notifiableId: json["notifiable_id"],
        data: json["data"] == null
            ? null
            : NotificationData.fromJson(json["data"]),
        readAt: json["read_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "notifiable_type": notifiableType,
        "notifiable_id": notifiableId,
        "data": data?.toJson(),
        "read_at": readAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class NotificationData {
  String? title;
  String? body;
  NotificationAction? data;

  NotificationData({
    this.title,
    this.body,
    this.data,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      NotificationData(
        title: json["title"],
        body: json["body"],
        data: json["data"] == null
            ? null
            : NotificationAction.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
        "data": data?.toJson(),
      };
}

class NotificationAction {
  String? clickAction;
  String? type;
  String? chatId;

  NotificationAction({
    this.clickAction,
    this.type,
    this.chatId,
  });

  factory NotificationAction.fromJson(Map<String, dynamic> json) =>
      NotificationAction(
        clickAction: json["click_action"],
        type: json["type"],
        chatId: json["chat_id"],
      );

  Map<String, dynamic> toJson() => {
        "click_action": clickAction,
        "type": type,
        "chat_id": chatId,
      };
}
