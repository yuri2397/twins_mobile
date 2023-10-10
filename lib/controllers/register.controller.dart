import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twinz/components/ui.dart';
import 'package:twinz/core/model/zodiaque.dart';
import 'package:twinz/core/services/register.service.dart';
import 'package:twinz/core/utils/utils.dart';
import 'package:twinz/routes/router.dart';
import 'package:dio/dio.dart' as dio;

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
  ];
  final lat = "".obs;
  final lng = "".obs;

  @override
  void onInit() async {
    super.onInit();
    determinePosition().then((value) {
      lat.value = "${value.latitude}";
      lng.value = "${value.longitude}";
    });
  }

  parseDate() {
    birthdayCtrl.text =
        "${bd1Ctrl.text.trim()}/${bd2Ctrl.text.trim()}/${bd3Ctrl.text.trim()}";
    DateTime date = DateTime.parse(
        "${bd3Ctrl.text.trim()}-${bd2Ctrl.text.trim()}-${bd1Ctrl.text.trim()}");
    signe.value = determinerSigne(date);
    Get.log(signe.value.description.toString());
  }

  save() async {
    loading.value = true;

    var finalFiles =
        files.map((e) => e.value).where((e) => e.path.isNotEmpty).toList();

    Map<String, dynamic> data = {
      "full_name": nameCtrl.text.trim(),
      "gender": gender.value,
      "birth_date": birthdayCtrl.text,
      "email": emailCtrl.text.trim(),
      "bio": bioCtrl.text.trim(),
      "password": passwordCtrl.text,
      "lat": lat.value,
      "lng": lng.value,
      "address": "Dakar",
      "password_confirmation": passwordCtrl.text,
      "device_name": await deviceName,
      "device_id": localStorage.getFcmToken(),
    };
    _registerService.register(data: data, files: finalFiles).then((value) {
      loading.value = false;
      successMessage(
          title: "Félicitations", content: "Votre compte est bien créer.");
      Get.offAllNamed(Goo.activeAccountScreen);
    }).catchError((e, s) {
      loading.value = false;

    });
  }
}
