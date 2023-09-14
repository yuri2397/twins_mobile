import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twins/controllers/register.controller.dart';
import 'package:twins/routes/router.dart';
import 'package:twins/shared/utils/colors.dart';

class AddBirthDayScreen extends GetView<RegisterController> {
  AddBirthDayScreen({super.key});
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
        body: Container(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Ajouter votre date de naissance.",
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
                  Form(
                    key: _form,
                    child: SizedBox(
                      width: Get.width,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Flexible(
                            child: TextFormField(
                                controller: controller.bd1Ctrl,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9.,]+'))
                                ],
                                validator: (value) {
                                  if (value == null) {
                                    return "Jours";
                                  }
                                  if (int.tryParse(value) == null) {
                                    return "Jours";
                                  }
                                  if (int.tryParse(value)! < 1 ||
                                      int.tryParse(value)! > 31) {
                                    return "Jours";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.number,
                                cursorColor: DARK_COLOR,
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(fontSize: 16),
                                    color: DARK_COLOR),
                                decoration: _decoration("Jours")),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: TextFormField(
                                controller: controller.bd2Ctrl,
                                keyboardType: TextInputType.number,
                                cursorColor: DARK_COLOR,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9.,]+'))
                                ],
                                validator: (value) {
                                  if (value == null) {
                                    return "Mois";
                                  }
                                  if (int.tryParse(value) == null) {
                                    return "Mois";
                                  }
                                  if (int.tryParse(value)! < 1 ||
                                      int.tryParse(value)! > 12) {
                                    return "Mois";
                                  }
                                  return null;
                                },
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(fontSize: 16),
                                    color: DARK_COLOR),
                                decoration: _decoration("Mois")),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            flex: 2,
                            child: TextFormField(
                                controller: controller.bd3Ctrl,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9.,]+'))
                                ],
                                validator: (value) {
                                  if (value == null) {
                                    return "Années";
                                  }
                                  if (int.tryParse(value) == null) {
                                    return "Années";
                                  }
                                  if (int.tryParse(value)! < 1980 ||
                                      int.tryParse(value)! >
                                          (DateTime.now().year - 10)) {
                                    return "Années";
                                  }
                                  return null;
                                },
                                cursorColor: DARK_COLOR,
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(fontSize: 16),
                                    color: DARK_COLOR),
                                decoration: _decoration("Année")),
                          ),
                        ],
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
                      controller.parseDate();
                      Get.toNamed(Goo.addSigneScreen);
                    }
                  },
                  child: const Text("Suivant"),
                ),
              )
            ],
          ),
        ));
  }

  _decoration(String text) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      hintText: text,
      hintStyle: const TextStyle(color: DARK_COLOR, fontFamily: "Poppins"),
      fillColor: NEUTRAL_COLOR,
      filled: true,
      errorStyle: const TextStyle(color: Colors.redAccent),
      errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Colors.redAccent)),
      focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: MAIN_COLOR)),
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: DARK_COLOR)),
    );
  }
}
