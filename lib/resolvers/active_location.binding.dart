import 'package:get/get.dart';
import 'package:twinz/controllers/active_location.controller.dart';

class ActiveLocationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ActiveLocationController(), fenix: true);
  }

}