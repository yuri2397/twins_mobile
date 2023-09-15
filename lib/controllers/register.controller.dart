import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twins/core/model/zodiaque.dart';
import 'package:twins/core/utils/utils.dart';

class RegisterController extends GetxController {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final bd1Ctrl = TextEditingController();
  final bd2Ctrl = TextEditingController();
  final bd3Ctrl = TextEditingController();
  final birthdayCtrl = TextEditingController();
  final files = <Rx<XFile>>[
    XFile("").obs,
    XFile("").obs,
    XFile("").obs,
    XFile("").obs,
    XFile("").obs,
    XFile("").obs,
  ];
  final signe = SigneZodiaque("", "", "").obs;

  final obscureText = true.obs;

  parseDate() {
    birthdayCtrl.text =
        "${bd3Ctrl.text.trim()}-${bd2Ctrl.text.trim()}-${bd1Ctrl.text.trim()}";
    DateTime date = DateTime.parse(birthdayCtrl.text);
    signe.value = determinerSigne(date);
    Get.log(signe.value.description.toString());
  }
}
