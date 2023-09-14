import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twins/controllers/onboarding.controller.dart';
import 'package:twins/core/config/env.dart';
import 'package:twins/routes/router.dart';
import 'package:twins/shared/utils/colors.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MAIN_COLOR,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Stack(
          children: [
            Positioned(
                left: 10,
                right: 10,
                top: 50,
                child: Column(
                  children: [
                    Text("Bienvenue sur ",
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontSize: 28,
                                color: Colors.white,
                                fontWeight: FontWeight.w800))),
                    SvgPicture.asset(
                      Env.appIcon,
                      width: 80,
                    )
                  ],
                )),
            Positioned(
                bottom: 0,
                left: 10,
                right: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "En appuyant sur “se connecter” ou “créer un compte”, vous acceptez nos conditions d'utilisation. Consultez notre politique de confidentialité et celle relative aux cookies pour en savoir plus sur le traitement de vos données.",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ).marginOnly(bottom: 20),
                    SizedBox(
                      width: Get.width,
                      child: ElevatedButton(
                          onPressed: () => Get.toNamed(Goo.loginScreen),
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: DARK_COLOR,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: const Text("Se connecter")),
                    ),
                    SizedBox(
                      width: Get.width,
                      child: ElevatedButton(
                          onPressed: () => Get.toNamed(Goo.registerScreen),
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.white,
                              foregroundColor: MAIN_COLOR,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: const Text("Créer un compte")),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
