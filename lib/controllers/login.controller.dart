import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twinz/components/ui.dart';
import 'package:twinz/core/services/firebase_message.service.dart';
import 'package:twinz/core/services/login.service.dart';
import 'package:twinz/core/services/profile.service.dart';
import 'package:twinz/core/utils/utils.dart';
import 'package:twinz/routes/router.dart';
import 'package:twinz/views/home/home.screen.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final username = "".obs;
  final password = "".obs;
  final obscureText = true.obs;
  final loadingRequest = false.obs;
  final activeAccountLoad = false.obs;
  final _loginService = Get.find<LoginService>();
  final resendLoad = false.obs;

  login() async {
    if (formKey.currentState!.validate()) {
      loadingRequest.value = true;
      _loginService
          .login(
        username: username.value.trim(),
        password: password.value,
      )
          .then((value) {
        var isActive = localStorage.getUser()?.emailVerified ?? false;
        if (!isActive) {
          Get.offAllNamed(Goo.activeAccountScreen);
        } else {
          Get.offAllNamed(Goo.homeScreen);
        }
        loadingRequest.value = false;
      }).catchError((e) {
        loadingRequest.value = false;
      });
    }
  }
}
