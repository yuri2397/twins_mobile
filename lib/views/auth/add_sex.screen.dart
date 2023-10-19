import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twinz/controllers/register.controller.dart';
import 'package:twinz/core/utils/utils.dart';
import 'package:twinz/routes/router.dart';
import 'package:twinz/shared/utils/colors.dart';

class AddSexScreen extends GetView<RegisterController> {
  AddSexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios, color: DARK_COLOR),
          ),
        ),
        body: Obx(
          () => Container(
            height: Get.height,
            width: Get.width,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Vous êtes",
                      style: TextStyle(
                          color: DARK_COLOR,
                          fontSize: 30,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CheckboxListTile(
                      value: controller.sex.value == "male",
                      onChanged: (bool? value) => controller.sex.value = "male",
                      title: const Text('Un homme'),
                      activeColor: MAIN_COLOR,
                    ),
                    CheckboxListTile(
                      value: controller.sex.value == "female",
                      activeColor: MAIN_COLOR,
                      onChanged: (bool? value) =>
                          controller.sex.value = "female",
                      title: const Text('Une femme'),
                    ),
                  ],
                )),
                SizedBox(
                  width: Get.width * .4,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: MAIN_COLOR,
                        foregroundColor: Colors.white),
                    onPressed: () {
                      Get.toNamed(Goo.addPasswordScreen);
                    },
                    child:
                        const Text("Suivant", style: TextStyle(fontSize: 18)),
                  ),
                )
              ],
            ).marginAll(20),
          ),
        ));
  }
}
