import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twins/controllers/register.controller.dart';
import 'package:twins/routes/router.dart';
import 'package:twins/shared/utils/colors.dart';

class AddSigneScreen extends GetView<RegisterController> {
  AddSigneScreen({super.key});

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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    controller.signe.value.nom,
                    style: const TextStyle(
                        color: DARK_COLOR,
                        fontSize: 25,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.start,
                  ).marginOnly(bottom: 20),
                  SvgPicture.asset(controller.signe.value.cheminImage,
                      width: 100),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(controller.signe.value.description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 18,
                          color: DARK_COLOR,
                          fontWeight: FontWeight.w400))
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
                  onPressed: () => Get.toNamed(Goo.addFilesScreen),
                  child: const Text("Suivant"),
                ),
              )
            ],
          ),
        ));
  }
}
