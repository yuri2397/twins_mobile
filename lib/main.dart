import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:twins/core/config/env.dart';
import 'package:twins/core/http/http_client.dart';
import 'package:twins/core/services/chat.service.dart';
import 'package:twins/core/services/chat_request.service.dart';
import 'package:twins/core/services/matching.service.dart';
import 'package:twins/routes/route.dart';
import 'package:twins/routes/router.dart';
import 'package:twins/shared/utils/app_hehavior.dart';
import 'package:twins/shared/utils/themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/services/local_storage.service.dart';
import 'core/services/profile.service.dart';

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

  await Get.putAsync(() => LocalStorageService().init());
  Get.lazyPut(() => HttpClient());
  Get.lazyPut(() => MatchingService());
  Get.lazyPut(() => ChatService());
  Get.lazyPut(() => ChatRequestService());
  Get.lazyPut(() => ProfileService(), fenix: true);
}