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
        body: SafeArea(
      child: Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.only(top: 30),
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
                      fontSize: 30,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 30,
                ),
                SvgPicture.asset(controller.signe.value.cheminImage,
                    width: 100),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  controller.signe.value.description,
                  style: const TextStyle(
                      color: DARK_COLOR,
                      fontSize: 18,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400),
                  textAlign: TextAlign.justify,
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
                onPressed: () => Get.toNamed(Goo.addFilesRegisterScreen),
                child: const Text("Suivant"),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
