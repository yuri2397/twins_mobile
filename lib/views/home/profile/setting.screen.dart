import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:twins/components/gender.widget.dart';
import 'package:twins/controllers/profile.controller.dart';
import 'package:twins/core/utils/utils.dart';
import 'package:twins/shared/utils/colors.dart';

class SettingScreen extends GetView<ProfileController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                      color: MAIN_COLOR,
                      fontSize: 20,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400),
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
                      "${controller.settings.value?.distanceInKilometers}") ??
                  20,
              interval: 20,
              showTicks: true,
              activeColor: MAIN_COLOR,
              showLabels: false,
              enableTooltip: true,
              minorTicksPerInterval: 1,
              onChanged: (dynamic value) {
                controller.settings.value?.distanceInKilometers = value.toInt();
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
                      color: MAIN_COLOR,
                      fontSize: 20,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400),
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
                      "${controller.settings.value?.distanceInKilometers}") ??
                  35,
              interval: 20,
              showTicks: true,
              activeColor: MAIN_COLOR,
              showLabels: false,
              enableTooltip: true,
              minorTicksPerInterval: 1,
              onChanged: (dynamic value) {
                controller.settings.value?.distanceInKilometers = value.toInt();
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
                      color: MAIN_COLOR,
                      fontSize: 20,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400),
                ).marginOnly(left: 10),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: SfRangeSlider(
                    min: 0,
                    max: 80,
                    interval: 10,
                    showTicks: false,
                    activeColor: MAIN_COLOR,
                    showLabels: false,
                    enableTooltip: true,
                    minorTicksPerInterval: 1,
                    onChanged: (SfRangeValues values) {
                      controller.settings.value?.ageMin = values.start?.toInt();
                      controller.settings.value?.ageMax = values.end?.toInt();
                      controller.settings.refresh();
                      Get.log(
                          "${controller.settings.value?.toJson().toString()}");
                      localStorage.settings = controller.settings.value;
                    },
                    values: SfRangeValues(
                        controller.settings.value?.ageMin ?? 21,
                        controller.settings.value?.ageMax ?? 45),
                  ),
                ),
                Text("21 - 35")
              ],
            ).marginSymmetric(horizontal: 20),
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
                      color: MAIN_COLOR,
                      fontSize: 20,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.start,
                ).marginOnly(left: 10),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            CheckboxListTile(
              value: false,
              onChanged: (bool? value) {},
              title: const Text('Homme'),
            ),
            CheckboxListTile(
              value: true,
              activeColor: MAIN_COLOR,
              onChanged: (bool? value) {},
              title: const Text('Femme'),
            ),
            CheckboxListTile(
              value: false,
              onChanged: (bool? value) {},
              title: const Text('Homme et Femme'),
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
                    : const Text("Enrégistrer"),
              ),
            )
          ],
        ).paddingAll(20),
      ),
    );
  }
}
