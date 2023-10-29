import 'package:get/get.dart';
import 'package:twinz/controllers/forgot_password.controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordController());
  }
}
