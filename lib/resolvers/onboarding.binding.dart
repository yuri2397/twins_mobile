import 'package:get/get.dart';
import 'package:twins/controllers/onboarding.controller.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OnboardingController(), fenix: true);
  }
}
