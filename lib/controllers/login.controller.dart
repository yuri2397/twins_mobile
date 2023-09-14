import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twins/core/services/login.service.dart';
import 'package:twins/routes/router.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final username = "".obs;
  final password = "".obs;
  final obscureText = true.obs;
  final loadingRequest = false.obs;

  final _loginService = Get.find<LoginService>();

  login() async {
    if (formKey.currentState!.validate()) {
      loadingRequest.value = true;
      _loginService
          .login(username: username.value.trim(), password: password.value)
          .then((value) {
        loadingRequest.value = false;
        Get.offAndToNamed(Goo.homeScreen);
      }).catchError((e) {
        loadingRequest.value = false;
        print(e);
      });
    }
  }
}
