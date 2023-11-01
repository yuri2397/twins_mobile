import 'package:get/get.dart';
import 'package:twinz/controllers/login.controller.dart';
import 'package:twinz/core/services/login.service.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(), fenix: true);
  }
}
