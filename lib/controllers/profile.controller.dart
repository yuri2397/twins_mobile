import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twins/components/ui.dart';
import 'package:twins/core/model/setting.dart';
import 'package:twins/core/services/profile.service.dart';
import 'package:twins/core/utils/utils.dart';
import 'package:twins/routes/router.dart';
import 'package:twins/shared/utils/colors.dart';

class ProfileController extends GetxController {
  final user = localStorage.getUser().obs;
  final settingStatus = false.obs;
  final logoutLoad = false.obs;
  final addPhotoLoad = false.obs;
  final updateLoad = false.obs;

  final settings = localStorage.getSettings().obs;
  final updateSettingsLoad = false.obs;
  final nameCrtl = TextEditingController();
  final emailCrtl = TextEditingController();
  final phoneCrtl = TextEditingController();
  final bioCrtl = TextEditingController();
  final addressCrtl = TextEditingController();
  final birthdayCrtl = TextEditingController();
  final sexCrtl = TextEditingController();
  final passwordCrtl = TextEditingController();

  /// FILES

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

  final _profileService = Get.find<ProfileService>();

  @override
  void onInit() {
    super.onInit();
    determinePosition().then((value) {
      var user = localStorage.getUser();
      user?.lat = value.latitude;
      user?.lng = value.longitude;
      localStorage.user = user;
      settingStatus.value = true;
    });

    profile();
    photos();
  }
  
  Future<void> updateProfilePhoto(XFile file) async{
    await _profileService.updateProfilePhoto(file).then((value){
      user.value = value;
      user.refresh();
      localStorage.user = value;
      settingStatus.value = true;
    }).catchError((e){
      print("$e");
      errorMessage(title: "DEBUG", content: "$e");
    });
  }

  Future<void> profile() async {
    _profileService.profile().then((value) {
      settings.value = value.settings;
      settings.refresh();
    }).catchError((e) {
      print(e);
    });
  }

  void save() {
    updateLoad.value = true;

    _profileService.profileUpdate(data: user.toJson()).then((value){
      user.value = value;
      user.refresh();
      updateLoad.value = false;
    }).catchError((e){
      updateLoad.value = false;
      errorMessage(title: "Oups !", content: "$e");
    });
  }

  updateSettings() async {
    updateSettingsLoad.value = true;
    await _profileService.updateSettings(settings.value!).then((value) =>
        successMessage(
            title: "Félicitation",
            content: "Paramètres sont maintenant à jour."));
    updateSettingsLoad.value = false;
  }

  addPhotos() {
    addPhotoLoad.value = true;

    _profileService
        .addPhotos(
            files.map((e) => e.value).where((e) => e.path.isNotEmpty).toList())
        .then((value) {
      addPhotoLoad.value = false;
    }).catchError((e) {
      addPhotoLoad.value = false;
    });
  }

  photos() {
    _profileService.getPhotos().then((value) async {
      int i = 0;
      for (var e in value) {
        files[i] = (await getImageXFileByUrl(e.url!)).obs;
        i++;
      }
    });
  }

  logout() async {
    Get.bottomSheet(Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Déconnexion",
              style: TextStyle(
                  color: DARK_COLOR,
                  fontFamily: "Poppins",
                  fontSize: 23,
                  fontWeight: FontWeight.w700)),
          const SizedBox(
            height: 10,
          ),
          const Text("Continuer la déconnexion? ",
              style: TextStyle(
                  color: DARK_COLOR,
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: TextButton.styleFrom(
                      backgroundColor: MAIN_COLOR,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6))),
                  onPressed: () {
                    logoutLoad.value = false;
                    _profileService.logout().then((value) {
                      logoutLoad.value = false;
                      localStorage.clear();
                      Get.offAllNamed(Goo.onboardingScreen);
                    }).catchError((e) {
                      logoutLoad.value = false;
                    });
                  },
                  child: const Text("Oui")),
              const SizedBox(
                width: 100,
              ),
              ElevatedButton(
                  style: TextButton.styleFrom(
                      foregroundColor: DARK_COLOR,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6))),
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text("Annuler")),
            ],
          )
        ],
      ),
    ));
  }
}
