import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twins/components/gender.widget.dart';
import 'package:twins/controllers/register.controller.dart';
import 'package:twins/routes/router.dart';
import 'package:twins/shared/utils/colors.dart';

class RegisterScreen extends GetView<RegisterController> {
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: NEUTRAL_COLOR,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: NEUTRAL_COLOR,
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
                  child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Bienvenue sur Twinz.",
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
                      "Présentez-vous en remplissant les détails afin que les gens en apprennent davantage sur vous.",
                      style: TextStyle(
                          color: DARK_COLOR,
                          fontSize: 16,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    Form(
                      key: _form,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            "Nom",
                            style: TextStyle(
                                color: MAIN_COLOR,
                                fontSize: 18,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.start,
                          ),
                          TextFormField(
                            controller: controller.nameCtrl,
                            cursorColor: DARK_COLOR,
                            validator: (value) {
                              if (value == null) {
                                return "Votre nom est obligatoire.";
                              }

                              if (value.length < 2) {
                                return "Tapez votre nom complet.";
                              }
                              return null;
                            },
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(fontSize: 16),
                                color: DARK_COLOR),
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 20),
                              hintText: "Nom complet",
                              hintStyle: TextStyle(
                                  color: DARK_COLOR, fontFamily: "Poppins"),
                              fillColor: Colors.white,
                              filled: true,
                              errorStyle: TextStyle(color: Colors.redAccent),
                              errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide:
                                      BorderSide(color: Colors.redAccent)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(color: MAIN_COLOR)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  borderSide: BorderSide(color: DARK_COLOR)),
                            ),
                          ).marginOnly(bottom: 20, top: 10),
                          const Text(
                            "Date de naissance",
                            style: TextStyle(
                                color: MAIN_COLOR,
                                fontSize: 18,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.start,
                          ).marginOnly(bottom: 10),
                          SizedBox(
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
                                          return "JJ";
                                        }
                                        if (int.tryParse(value) == null) {
                                          return "JJ";
                                        }
                                        if (int.tryParse(value)! < 1 ||
                                            int.tryParse(value)! > 31) {
                                          return "JJ";
                                        }
                                        if (value.length != 2) {
                                          return "JJ";
                                        }
                                        return null;
                                      },
                                      keyboardType: TextInputType.number,
                                      cursorColor: DARK_COLOR,
                                      style: GoogleFonts.poppins(
                                          textStyle:
                                              const TextStyle(fontSize: 16),
                                          color: DARK_COLOR),
                                      decoration: _decoration("JJ")),
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
                                          return "MM";
                                        }
                                        if (int.tryParse(value) == null) {
                                          return "MM";
                                        }
                                        if (int.tryParse(value)! < 1 ||
                                            int.tryParse(value)! > 12) {
                                          return "MM";
                                        }
                                        if (value.length != 2) {
                                          return "MM";
                                        }
                                        return null;
                                      },
                                      style: GoogleFonts.poppins(
                                          textStyle:
                                              const TextStyle(fontSize: 16),
                                          color: DARK_COLOR),
                                      decoration: _decoration("MM")),
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
                                          return "AAAA";
                                        }
                                        if (int.tryParse(value) == null) {
                                          return "AAAA";
                                        }
                                        if (int.tryParse(value)! < 1980 ||
                                            int.tryParse(value)! >
                                                (DateTime.now().year - 10)) {
                                          return "AAAA";
                                        }
                                        if (value.length != 4) {
                                          return "AAAA";
                                        }
                                        return null;
                                      },
                                      cursorColor: DARK_COLOR,
                                      style: GoogleFonts.poppins(
                                          textStyle:
                                              const TextStyle(fontSize: 16),
                                          color: DARK_COLOR),
                                      decoration: _decoration("AAAA")),
                                ),
                              ],
                            ),
                          ).marginOnly(bottom: 20),
                          const Text(
                            "Je suis ?",
                            style: TextStyle(
                                color: MAIN_COLOR,
                                fontSize: 18,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.start,
                          ),
                          GenderWidget(
                            gender: controller.gender,
                            onChange: (value) => controller.gender.value,
                          ).marginOnly(top: 10, bottom: 30),
                        ],
                      ),
                    ),
                  ],
                ),
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
                      Get.toNamed(Goo.addEmailScreen);
                    }
                  },
                  child: const Text("Suivant"),
                ),
              )
            ],
          ).paddingAll(20),
        ));
  }

  _decoration(String text) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      hintText: text,
      hintStyle: const TextStyle(color: DARK_COLOR, fontFamily: "Poppins"),
      fillColor: Colors.white,
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
