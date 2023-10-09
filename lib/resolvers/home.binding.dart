import 'package:get/get.dart';
import 'package:twins/controllers/chat.controller.dart';
import 'package:twins/controllers/chat_request.controller.dart';
import 'package:twins/controllers/home.controller.dart';
import 'package:twins/controllers/notification.controller.dart';
import 'package:twins/controllers/profile.controller.dart';
import 'package:twins/controllers/search.controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatRequestController(), fenix: true);
    Get.lazyPut(() => NotificationController(), fenix: true);
    Get.lazyPut(() => SearchController(), fenix: true);
    Get.lazyPut(() => ChatController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}
