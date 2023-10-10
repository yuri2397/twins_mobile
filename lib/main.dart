import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:twinz/core/config/env.dart';
import 'package:twinz/core/http/http_client.dart';
import 'package:twinz/core/services/chat.service.dart';
import 'package:twinz/core/services/chat_request.service.dart';
import 'package:twinz/core/services/firebase.service.dart';
import 'package:twinz/core/services/matching.service.dart';
import 'package:twinz/core/services/notification.service.dart';
import 'package:twinz/core/services/user.service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


import 'package:twinz/routes/route.dart';
import 'package:twinz/routes/router.dart';
import 'package:twinz/shared/utils/app_hehavior.dart';
import 'package:twinz/shared/utils/themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/services/local_storage.service.dart';
import 'core/services/profile.service.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await _initServices();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(GetMaterialApp(
      supportedLocales: const [
        Locale('fr', 'FR'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: Goo.splashScreen,
      getPages: ROUTER_OUTLET,
      title: Env.appName,
      defaultTransition: Transition.cupertinoDialog,
      scrollBehavior: const AppBehavior(),
      theme: defaultTheme,
    ));
  });
}

_initServices() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = "pk_test_51NzOrSEPpMAZs8URt5nfmsaCLY2UfaCnS7DZ1JciZCBi27vuUX6xuQJU8kFXe7dQh5eKoRSuKKZBV1Ra1VeqzWgc004QuuyYgf";

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await Get.putAsync(() => LocalStorageService().init());
  await Get.putAsync(() => FirebaseService().init());

  Get.lazyPut(() => HttpClient());
  Get.lazyPut(() => MatchingService());
  Get.lazyPut(() => ChatService());
  Get.lazyPut(() => ChatRequestService());
  Get.lazyPut(() => UserService());
  Get.lazyPut(() => NotificationService());
  Get.lazyPut(() => ProfileService(), fenix: true);
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}
