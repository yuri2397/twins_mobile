import 'package:get/get.dart';
import 'package:twins/controllers/login.controller.dart';
import 'package:twins/core/services/login.service.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginService(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
  }
}
