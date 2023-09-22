import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twins/core/model/zodiaque.dart';
import 'package:twins/core/services/register.service.dart';
import 'package:twins/core/utils/utils.dart';

class RegisterController extends GetxController {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final bioCtrl = TextEditingController();
  final bd1Ctrl = TextEditingController();
  final bd2Ctrl = TextEditingController();
  final bd3Ctrl = TextEditingController();
  final birthdayCtrl = TextEditingController();
  final gender = 'male'.obs;
  final files = <Rx<XFile>>[
    XFile("").obs,
    XFile("").obs,
    XFile("").obs,
    XFile("").obs,
    XFile("").obs,
    XFile("").obs,
  ];
  final avatarFile = XFile("").obs;
  final signe = SigneZodiaque("", "", "").obs;

  final obscureText = true.obs;
  final loading = false.obs;

  final _registerService = Get.find<RegisterService>();

  parseDate() {
    birthdayCtrl.text =
        "${bd3Ctrl.text.trim()}-${bd2Ctrl.text.trim()}-${bd1Ctrl.text.trim()}";
    DateTime date = DateTime.parse(birthdayCtrl.text);
    signe.value = determinerSigne(date);
    Get.log(signe.value.description.toString());
  }

  save() async {
    loading.value = true;
    var data = {
      "full_name": nameCtrl.text.trim(),
      "gender": gender.value,
      "birth_date": birthdayCtrl.text,
      "email": emailCtrl.text.trim(),
      "password": passwordCtrl.text,
      "password_confirmation": passwordCtrl.text,
      // "phone_number": "778123456",
      "device_name": await deviceName
    };
    _registerService
        .register(data: data, avatar: avatarFile.value)
        .then((value) {
      loading.value = false;
    }).catchError((e) {
      loading.value = false;
      print(e);
    });
  }
}
