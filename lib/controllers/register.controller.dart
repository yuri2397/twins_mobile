import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twins/components/ui.dart';
import 'package:twins/core/model/zodiaque.dart';
import 'package:twins/core/services/register.service.dart';
import 'package:twins/core/utils/utils.dart';
import 'package:twins/routes/router.dart';

class RegisterController extends GetxController {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final bioCtrl = TextEditingController();
  final bd1Ctrl = TextEditingController();
  final bd2Ctrl = TextEditingController();
  final bd3Ctrl = TextEditingController();
  final birthdayCtrl = TextEditingController();
  final showFilesMessage = true.obs;
  final gender = 'male'.obs;

  final avatarFile = XFile("").obs;
  final signe = SigneZodiaque("", "", "").obs;

  final obscureText = true.obs;
  final loading = false.obs;

  final _registerService = Get.find<RegisterService>();

  final files = <Rx<XFile>>[
    XFile("").obs,
    XFile("").obs,
    XFile("").obs,
    XFile("").obs,
    XFile("").obs,
    XFile("").obs,
    XFile("").obs,
    XFile("").obs,
    XFile("").obs,
  ];
  parseDate() {
    birthdayCtrl.text =
        "${bd3Ctrl.text.trim()}/${bd2Ctrl.text.trim()}/${bd1Ctrl.text.trim()}";
    DateTime date = DateTime.parse(
        "${bd3Ctrl.text.trim()}-${bd2Ctrl.text.trim()}-${bd1Ctrl.text.trim()}");
    signe.value = determinerSigne(date);
    Get.log(signe.value.description.toString());
  }



  save() async {
    loading.value = true;


    var finalFiles =  files.map((e) => e.value).where((e) => e.path.isNotEmpty).toList();

    Map<String, String> data = {
      "full_name": nameCtrl.text.trim(),
      "gender": gender.value,
      "birth_date": birthdayCtrl.text,
      "email": emailCtrl.text.trim(),
      "password": passwordCtrl.text,
      "password_confirmation": passwordCtrl.text,
      "phone_number": "778123456",
      "address": addressCtrl.text,
      "device_name": await deviceName,
    };
    _registerService
        .register(data: data, avatar: avatarFile.value, files: finalFiles)
        .then((value) {
      loading.value = false;
      successMessage(
          title: "Félicitations", content: "Votre compte est bien créer.");
      Get.offAllNamed(Goo.activeAccountScreen);
    }).catchError((e) {
      loading.value = false;
      errorMessage(
          title: "Oups !!!",
          content: "Une erreur s'est produite lors de l'inscription.");
    });
  }
}
