import 'package:flutter/material.dart';
import 'package:get/get.dart';

errorMessage(
    {required String title, required String content, SnackPosition? position}) {
  Get.snackbar(title, content,
      colorText: Colors.white,
      backgroundColor: Colors.redAccent,
      snackPosition: position ?? SnackPosition.TOP,
      borderRadius: 20,
      icon: const Icon(
        Icons.error_outline,
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10));
}

successMessage(
    {required String title, required String content, SnackPosition? position}) {
  Get.snackbar(title, content,
      colorText: Colors.white,
      backgroundColor: Colors.greenAccent,
      snackPosition: position ?? SnackPosition.TOP,
      borderRadius: 20,
      icon: const Icon(
        Icons.error_outline,
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10));
}

infoMessage({required String title, required String content}) {}

warningMessage({required String title, required String content}) {}
