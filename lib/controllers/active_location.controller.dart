import 'package:get/get.dart';
import 'package:twinz/core/utils/utils.dart';
import 'package:twinz/routes/router.dart';

class ActiveLocationController extends GetxService{
  final lat = "".obs;
  final lng = "".obs;
  activeLocation() {
    determinePosition().then((value) {
      lat.value = "${value.latitude}";
      lng.value = "${value.longitude}";
      Get.offAllNamed(Goo.registerScreen);
    }).catchError((e){
      print("EEEEEEEEEEEEEEEEEEEEE $e");
    });
  }
}