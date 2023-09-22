import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twins/controllers/register.controller.dart';
import 'package:twins/routes/router.dart';
import 'package:twins/shared/utils/colors.dart';

class AddPasswordScreen extends GetView<RegisterController> {
  AddPasswordScreen({super.key});

  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: NEUTRAL_COLOR,
        appBar: AppBar(
          backgroundColor: NEUTRAL_COLOR,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Sécurisez votre compte",
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
                      "Utilisez un mot de passe pour garantir la sécurité de votre compte.",
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
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 20),
                          hintText: "Mot de passe",
                          hintStyle: const TextStyle(
                              color: DARK_COLOR, fontFamily: "Poppins"),
                          fillColor: Colors.white,
                          filled: true,
                          suffix: GestureDetector(
                              onTap: () => controller.obscureText.value =
                                  !controller.obscureText.value,
                              child: Icon(controller.obscureText.value
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          errorStyle: const TextStyle(color: Colors.redAccent),
                          errorBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.redAccent)),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: MAIN_COLOR)),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: DARK_COLOR)),
                        ),
                      ),
                    ),
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
                    onPressed: () {
                      if (_form.currentState!.validate()) {
                        Get.toNamed(Goo.addBioScreen);
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
