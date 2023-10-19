import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:twinz/core/utils/utils.dart';

class FirebaseService extends GetxService {
  final fcmToken = "".obs;
  final authorizeNotification = false.obs;
  Future<FirebaseService> init() async {
    try {
      fcmToken.value = await FirebaseMessaging.instance.getToken() ?? "";
      localStorage.fcmToken = fcmToken.value;
      print(fcmToken.value);
    } catch (e) {
      print("$e");
    }
    return this;
  }

  onFirstPlanMessage() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }
}
