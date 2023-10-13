import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:twinz/controllers/profile.controller.dart';
import 'package:twinz/core/utils/utils.dart';
import 'package:twinz/shared/utils/colors.dart';

class SettingScreen extends GetView<ProfileController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MAIN_COLOR,
        elevation: 0,
        leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios, color: Colors.white)),
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Réglages",
                style: TextStyle(
                    color: MAIN_COLOR,
                    fontSize: 30,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.circle,
                    color: MAIN_COLOR,
                    size: 20,
                  ),
                  const Text(
                    "Distance",
                    style: TextStyle(
                        color: DARK_COLOR,
                        fontSize: 20,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold),
                  ).marginOnly(left: 10),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SfSlider(
                min: 1,
                max: 50,
                value: double.tryParse(
                        "${controller.settings.value?.distanceInKilometers ?? 0}") ??
                    0,
                interval: 20,
                showTicks: false,
                activeColor: MAIN_COLOR,
                showLabels: false,
                enableTooltip: true,
                minorTicksPerInterval: 1,
                onChanged: (dynamic value) {
                  controller.settings.value?.distanceInKilometers =
                      value.toInt();
                  controller.settings.refresh();
                  localStorage.settings = controller.settings.value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.circle,
                    color: MAIN_COLOR,
                    size: 20,
                  ),
                  const Text(
                    "Ecart",
                    style: TextStyle(
                        color: DARK_COLOR,
                        fontSize: 20,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold),
                  ).marginOnly(left: 10),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SfSlider(
                min: controller.user.value?.isPremium != null &&
                        controller.user.value?.isPremium == true
                    ? 3
                    : 15,
                max: 15,
                value: double.tryParse(
                        "${controller.settings.value?.differenceInDays ?? 0}") ??
                    1,
                interval: 20,
                showTicks: false,
                activeColor: MAIN_COLOR,
                showLabels: false,
                enableTooltip: true,
                minorTicksPerInterval: 1,
                onChanged: (dynamic value) {
                  controller.settings.value?.differenceInDays = value.toInt();
                  controller.settings.refresh();
                  localStorage.settings = controller.settings.value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.circle,
                    color: MAIN_COLOR,
                    size: 20,
                  ),
                  const Text(
                    "Tranche d'âge",
                    style: TextStyle(
                        color: DARK_COLOR,
                        fontSize: 20,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold),
                  ).marginOnly(left: 10),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: Get.width - 100,
                    child: SfRangeSlider(
                      min: 18,
                      max: 65,
                      interval: 10,
                      showTicks: false,
                      activeColor: MAIN_COLOR,
                      showLabels: false,
                      enableTooltip: true,
                      minorTicksPerInterval: 1,
                      onChanged: (SfRangeValues values) {
                        controller.settings.value?.ageMin =
                            values.start?.toInt();
                        controller.settings.value?.ageMax = values.end?.toInt();
                        controller.settings.refresh();
                        Get.log(
                            "${controller.settings.value?.toJson().toString()}");
                        localStorage.settings = controller.settings.value;
                      },
                      values: SfRangeValues(
                          controller.settings.value?.ageMin ?? 18,
                          controller.settings.value?.ageMax ?? 65),
                    ),
                  ),
                  const Text("18 - 65")
                ],
              ).marginSymmetric(),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.circle,
                    color: MAIN_COLOR,
                    size: 20,
                  ),
                  const Text(
                    "Sexe",
                    style: TextStyle(
                        color: DARK_COLOR,
                        fontSize: 20,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ).marginOnly(left: 10),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              CheckboxListTile(
                value: controller.settings.value?.gender == "male",
                onChanged: (bool? value) => controller.changeGender("male"),
                title: const Text('Hommes'),
                activeColor: MAIN_COLOR,
              ),
              CheckboxListTile(
                value: controller.settings.value?.gender == "female",
                activeColor: MAIN_COLOR,
                onChanged: (bool? value) => controller.changeGender("female"),
                title: const Text('Femmes'),
              ),
              CheckboxListTile(
                value: controller.settings.value?.gender == "both",
                onChanged: (bool? value) => controller.changeGender("both"),
                activeColor: MAIN_COLOR,
                title: const Text('Hommes et Femmes'),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: Get.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: MAIN_COLOR,
                      foregroundColor: Colors.white),
                  onPressed: () => controller.updateSettings(),
                  child: controller.updateSettingsLoad.value
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(color: Colors.white))
                      : const Text("Enregistrer"),
                ),
              )
            ],
          ).paddingAll(20),
        ),
      ),
    );
  }
}
