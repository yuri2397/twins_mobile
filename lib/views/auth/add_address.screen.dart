import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twins/controllers/register.controller.dart';
import 'package:twins/routes/router.dart';
import 'package:twins/shared/utils/colors.dart';

class AddAddressScreen extends GetView<RegisterController> {
  AddAddressScreen({super.key});

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
        body: Container(
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Ajouter votre adresse",
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
                    "Pour trouver des personnes dans votre localité, veuillez ajouter votre adresse.",
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
                      controller: controller.addressCtrl,
                      keyboardType: TextInputType.text,
                      cursorColor: DARK_COLOR,
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(fontSize: 16),
                          color: DARK_COLOR),
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                        hintText: "Adresse",
                        hintStyle:
                            TextStyle(color: DARK_COLOR, fontFamily: "Poppins"),
                        fillColor: Colors.white,
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
                    Get.toNamed(Goo.addPasswordScreen);
                  },
                  child: const Text("Suivant"),
                ),
              )
            ],
          ).paddingAll(20),
        ));
  }
}
