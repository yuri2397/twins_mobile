import 'package:get/get.dart';
import 'package:twinz/controllers/register.controller.dart';
import 'package:twinz/core/services/register.service.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterService(), fenix: true);
    Get.lazyPut(() => RegisterController(), fenix: true);
  }
}
