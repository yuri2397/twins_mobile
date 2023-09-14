import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twins/controllers/register.controller.dart';
import 'package:twins/shared/utils/colors.dart';

class AddFielsScreen extends GetView<RegisterController> {
  const AddFielsScreen({super.key});

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
          child: Stack(
            children: [
              TextFormField(
                controller: controller.nameCtrl,
                cursorColor: DARK_COLOR,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(fontSize: 20),
                    color: DARK_COLOR),
                decoration: const InputDecoration(
                  hintText: "Ajouter votre nom complet ?",
                  hintStyle: TextStyle(color: DARK_COLOR),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: DARK_COLOR)),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 10,
                right: 10,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: MAIN_COLOR,
                      foregroundColor: Colors.white),
                  onPressed: () {},
                  child: const Text("Suivant"),
                ),
              )
            ],
          ),
        ));
  }
}
