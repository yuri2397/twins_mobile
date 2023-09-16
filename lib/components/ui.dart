import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twins/shared/utils/colors.dart';

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

itemIcon(IconData icon) {
  return Container(
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 20,
          offset: const Offset(2, 3), // changes position of shadow
        ),
      ],
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    ),
    child: Icon(
      icon,
      color: MAIN_COLOR,
    ),
  );
}
