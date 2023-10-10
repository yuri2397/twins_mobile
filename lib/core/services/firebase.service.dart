import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:twinz/core/utils/utils.dart';

class FirebaseService extends GetxService {
  final fcmToken = "".obs;
  final authorizeNotification = localStorage.getAuthNotification().obs;

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

  onTokenRefresh() {
    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
      // TODO: If necessary send token to application server.

      // Note: This callback is fired at each app startup and whenever a new
      // token is generated.
    }).onError((err) {
      // Error getting token.
    });
  }

  requestPermissions() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      authorizeNotification.value = localStorage.authNotification = true;
    } else {
      authorizeNotification.value = localStorage.authNotification = false;
    }

    print('User granted permission: ${settings.authorizationStatus}');
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
