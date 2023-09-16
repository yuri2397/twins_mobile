import 'package:get/get.dart';
import 'package:twins/controllers/home.controller.dart';
import 'package:twins/controllers/profile.controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
  }
}
