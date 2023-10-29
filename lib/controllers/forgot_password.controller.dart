import 'package:get/get.dart';
import 'package:twinz/components/ui.dart';
import 'package:twinz/core/services/login.service.dart';

class ForgotPasswordController extends GetxController {
  final email = "".obs;
  final loadingRequest = false.obs;
  final _authService = Get.find<LoginService>();

  @override
  void onInit() {
    super.onInit();
  }

  // reset poassword
  Future<void> resetPassword() async {
    try {
      loadingRequest.value = true;
      var response = await _authService.resetPassword(email: email.value);
      print("REPONSE/: $response");
      if (response) {
        loadingRequest.value = false;
        Get.back();

        successMessage(
            title: "Succès",
            content: "Un lien de réinitialisation vous a été envoyé.");
        // to login
      }
    } catch (e) {
      loadingRequest.value = false;
      Get.snackbar("Erreur", "$e");
    }
  }
}
