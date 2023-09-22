import 'package:get/get.dart';
import 'package:twins/controllers/register.controller.dart';
import 'package:twins/core/services/register.service.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterService(), fenix: true);
    Get.lazyPut(() => RegisterController(), fenix: true);
  }
}
