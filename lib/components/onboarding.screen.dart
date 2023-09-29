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
                    Image.asset(
                      Env.whiteLogo,
                      width: 120,
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
                    RichText(
                        text: const TextSpan(
                            text:
                                "En appuyant sur se connecter ou créer un compter, vous acceptez nos conditions d'utilisation. Consultez notre ",
                            children: [
                          TextSpan(
                            text: "politique de confidentialité",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          TextSpan(
                            text: " et celle ",
                          ),
                          TextSpan(
                            text: "relative aux cookies",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold

                            ),
                          ),
                          TextSpan(
                            text:
                                " pour en savoir plus sur le traitement de vos données.",
                          ),
                        ])).marginOnly(bottom: 20),
                    SizedBox(
                      width: Get.width,
                      child: ElevatedButton(
                          onPressed: () => Get.toNamed(Goo.loginScreen),
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: MAIN_COLOR,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.white, width: 1.5),
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
