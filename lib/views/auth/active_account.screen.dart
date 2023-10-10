import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:twinz/controllers/active_account.controller.dart';
import 'package:twinz/controllers/login.controller.dart';
import 'package:twinz/shared/utils/colors.dart';

class ActiveAccountScreen extends GetView<ActiveAccountController> {
  const ActiveAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          backgroundColor: NEUTRAL_COLOR,
          body: Container(
            height: Get.height,
            width: Get.width,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Bienvenue sur Twinz",
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
                        "Pour continuer, merci de vérifier votre addresse email.",
                        style: TextStyle(
                            color: DARK_COLOR,
                            fontSize: 16,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                      SvgPicture.asset("assets/images/active.svg"),
                      TextButton(
                        onPressed: () => controller.refreshStatus(),
                        child: const Text("Adresse e-mail déjà vérifié?",
                            style: TextStyle(color: MAIN_COLOR)),
                      ),
                      if (controller.activeAccountLoad.value)
                        const CircularProgressIndicator(color: MAIN_COLOR)
                            .marginSymmetric(vertical: 20),
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
                    onPressed: () => controller.resendLink(),
                    child: controller.resendLoad.value
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ))
                        : const Text("Envoyer un nouveau code"),
                  ),
                ),
              ],
            ).paddingAll(20),
          )),
    );
  }
}
