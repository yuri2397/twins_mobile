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
        backgroundColor: NEUTRAL_COLOR,
        appBar: AppBar(
          backgroundColor: NEUTRAL_COLOR,
          elevation: 0,
        ),
        body: Obx(
          () => Container(
            height: Get.height,
            width: Get.width,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Paramètres",
                      style: TextStyle(
                          color: MAIN_COLOR,
                          fontSize: 30,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Modifier vos paramètres pour perfectionner vos rechecher et matchings.",
                      style: TextStyle(
                          color: DARK_COLOR,
                          fontSize: 16,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: Get.width,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 20,
                                    offset: const Offset(
                                        2, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  const Text(
                                    "Distance en km",
                                    style: TextStyle(
                                        color: MAIN_COLOR,
                                        fontSize: 18,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SfSlider(
                                    min: 0,
                                    max: 100,
                                    value: double.tryParse(
                                            "${controller.settings.value?.distanceInKilometers}") ??
                                        0,
                                    interval: 20,
                                    showTicks: false,
                                    activeColor: MAIN_COLOR,
                                    showLabels: true,
                                    enableTooltip: true,
                                    minorTicksPerInterval: 1,
                                    onChanged: (dynamic value) {
                                      controller.settings.value
                                              ?.distanceInKilometers =
                                          value.toInt();
                                      controller.settings.refresh();
                                      localStorage.settings =
                                          controller.settings.value;
                                    },
                                  ),
                                ],
                              )),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                              width: Get.width,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 20,
                                    offset: const Offset(
                                        2, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(children: [
                                const Text(
                                  "Choisir une plage d'âge",
                                  style: TextStyle(
                                      color: MAIN_COLOR,
                                      fontSize: 18,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SfRangeSlider(
                                  min: 0,
                                  max: 100,
                                  interval: 20,
                                  showTicks: false,
                                  activeColor: MAIN_COLOR,
                                  showLabels: true,
                                  enableTooltip: true,
                                  minorTicksPerInterval: 1,
                                  onChanged: (SfRangeValues values) {
                                    controller.settings.value?.ageMin =
                                        values.start?.toInt();
                                    controller.settings.value?.ageMax =
                                        values.end?.toInt();
                                    controller.settings.refresh();
                                    Get.log(
                                        "${controller.settings.value?.toJson().toString()}");
                                    localStorage.settings =
                                        controller.settings.value;
                                  },
                                  values: SfRangeValues(
                                      controller.settings.value?.ageMin ?? 0,
                                      controller.settings.value?.ageMax ?? 0),
                                ),
                              ])),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: Get.width,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 1,
                                  blurRadius: 20,
                                  offset: const Offset(
                                      2, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  "Vous cherchez ?",
                                  style: TextStyle(
                                      color: MAIN_COLOR,
                                      fontSize: 18,
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                GenderWidget(
                                  gender: (controller.settings.value?.gender ??
                                          'male')
                                      .obs,
                                  onChange: (value) =>
                                      controller.settings.value?.gender = value,
                                ).marginSymmetric(horizontal: 20)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
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
                            child:
                                CircularProgressIndicator(color: Colors.white))
                        : const Text("Enrégistrer"),
                  ),
                )
              ],
            ).paddingAll(20),
          ),
        ));
  }
}
