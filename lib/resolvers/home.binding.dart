import 'package:get/get.dart';
import 'package:twinz/controllers/chat.controller.dart';
import 'package:twinz/controllers/chat_request.controller.dart';
import 'package:twinz/controllers/home.controller.dart';
import 'package:twinz/controllers/notification.controller.dart';
import 'package:twinz/controllers/profile.controller.dart';
import 'package:twinz/controllers/search.controller.dart';

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
