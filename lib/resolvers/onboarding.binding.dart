import 'package:get/get.dart';
import 'package:twinz/controllers/onboarding.controller.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingController(), fenix: true);
  }
}
