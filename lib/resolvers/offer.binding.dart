import 'package:get/get.dart';
import 'package:twins/controllers/offer.controller.dart';

class OfferBindinge extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => OfferController(), fenix: true);
  }

}