import 'package:get/get.dart';
import 'package:twinz/controllers/active_account.controller.dart';

class ActiveAccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ActiveAccountController());
  }
}
