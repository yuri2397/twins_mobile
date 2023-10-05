import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twins/controllers/register.controller.dart';
import 'package:twins/core/utils/utils.dart';
import 'package:twins/routes/router.dart';
import 'package:twins/shared/utils/colors.dart';

class AddPasswordScreen extends GetView<RegisterController> {
  AddPasswordScreen({super.key});

  final _form = GlobalKey<FormState>();
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
                      "Choisissez un mot de passe",
                      style: TextStyle(
                          color: DARK_COLOR,
                          fontSize: 30,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Form(
                      key: _form,
                      child: TextFormField(
                          controller: controller.passwordCtrl,
                          keyboardType: TextInputType.visiblePassword,
                          cursorColor: DARK_COLOR,
                          validator: (value) {
                            if (value == null) {
                              return "Mot de passe obligatoire.";
                            }

                            if (value.length < 6) {
                              return "Mot de passe pas sécurisé.";
                            }
                            return null;
                          },
                          obscureText: controller.obscureText.value,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(fontSize: 16),
                              color: DARK_COLOR),
                          decoration: decoration("Mot de passe...")),
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
                      if (_form.currentState!.validate()) {
                        Get.toNamed(Goo.addBirthDayScreen);
                      }
                    },
                    child: const Text("Suivant"),
                  ),
                )
              ],
            ).marginAll(20),
          ),
        ));
  }
}
