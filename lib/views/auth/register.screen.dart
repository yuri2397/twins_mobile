import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twins/controllers/register.controller.dart';
import 'package:twins/routes/router.dart';
import 'package:twins/shared/utils/colors.dart';

class RegisterScreen extends GetView<RegisterController> {
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
                    "Quel est votre nom complet?",
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
                    child: TextFormField(
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
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                        hintText: "Nom complet",
                        hintStyle:
                            TextStyle(color: DARK_COLOR, fontFamily: "Poppins"),
                        fillColor: NEUTRAL_COLOR,
                        filled: true,
                        errorStyle: TextStyle(color: Colors.redAccent),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: Colors.redAccent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(color: MAIN_COLOR)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
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
                      Get.toNamed(Goo.addEmailScreen);
                    }
                  },
                  child: const Text("Suivant"),
                ),
              )
            ],
          ),
        ));
  }
}
