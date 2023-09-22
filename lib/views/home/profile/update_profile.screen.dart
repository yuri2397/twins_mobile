import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twins/components/gender.widget.dart';
import 'package:twins/controllers/profile.controller.dart';
import 'package:twins/shared/utils/colors.dart';

class UpdateProfileScreen extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NEUTRAL_COLOR,
        appBar: AppBar(
          backgroundColor: NEUTRAL_COLOR,
          elevation: 0,
          actions: [
            GestureDetector(
              onTap: () => controller.save(),
              child: Center(
                  child: const Text("Enrégistrer",
                          style: TextStyle(color: MAIN_COLOR, fontSize: 16))
                      .marginOnly(right: 10)),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Center(
                    child: Text(
                  "Mettre à jour vos informations",
                  style: TextStyle(
                      color: MAIN_COLOR,
                      fontSize: 30,
                      fontWeight: FontWeight.w800),
                  textAlign: TextAlign.center,
                )),
                const SizedBox(
                  height: 30,
                ),
                const Text("Nom complet",
                    style: TextStyle(
                      color: MAIN_COLOR,
                    )).marginOnly(bottom: 8),
                TextFormField(
                    controller: controller.nameCrtl,
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
                    decoration: _decoration("${controller.user?.fullName}")),
                const SizedBox(
                  height: 20,
                ),
                const Text("Adresse mail",
                    style: TextStyle(
                      color: MAIN_COLOR,
                    )).marginOnly(bottom: 8),
                TextFormField(
                    controller: controller.addressCrtl,
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
                    decoration:
                        _decoration(controller.user?.email ?? "Adresse mail")),
                const SizedBox(
                  height: 20,
                ),
                const Text("Téléphone",
                    style: TextStyle(
                      color: MAIN_COLOR,
                    )).marginOnly(bottom: 8),
                TextFormField(
                    controller: controller.phoneCrtl,
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
                    decoration: _decoration("${controller.user?.phoneNumber}")),
                const SizedBox(
                  height: 20,
                ),
                const Text("Bio",
                    style: TextStyle(
                      color: MAIN_COLOR,
                    )).marginOnly(bottom: 8),
                TextFormField(
                    controller: controller.bioCrtl,
                    cursorColor: DARK_COLOR,
                    minLines: 3,
                    maxLines: 3,
                    style: GoogleFonts.poppins(
                        textStyle: const TextStyle(fontSize: 16),
                        color: DARK_COLOR),
                    decoration: _decoration(
                        controller.user?.bio ?? "Ajouter votre bio...")),
                const SizedBox(
                  height: 20,
                ),
                const Text("Sexe",
                    style: TextStyle(
                      color: MAIN_COLOR,
                    )).marginOnly(bottom: 8),
                GenderWidget(
                  gender: (controller.user?.gender ?? "male").obs,
                  onChange: (value) => controller.user?.gender = value,
                )
              ],
            ),
          ),
        ));
  }

  _decoration(String s) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      hintText: s,
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
