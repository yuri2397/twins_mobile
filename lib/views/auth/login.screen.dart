import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:twinz/components/button.widget.dart';
import 'package:twinz/components/input.widget.dart';
import 'package:twinz/controllers/login.controller.dart';
import 'package:twinz/routes/router.dart';
import 'package:twinz/shared/utils/colors.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: Get.height * .4,
                width: Get.width,
                child: SvgPicture.asset("assets/images/login.svg",
                    fit: BoxFit.cover),
              ),
              Container(
                margin: const EdgeInsets.only(top: 8),
                height: Get.height * .6,
                width: Get.width,
                decoration: BoxDecoration(
                  color: MAIN_COLOR,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 20,
                      offset: const Offset(2, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("Connexion",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white))
                            .marginOnly(bottom: 20),
                        TwinsInput(
                          label: "E-mail ou téléphone",
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) =>
                              controller.username.value = value,
                          validator: (value) {
                            if (value == null) {
                              return "Adresse email obligatoire.";
                            }
                            if (!value.isEmail) {
                              return "Adresse email incorrect";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TwinsInput(
                          label: "Mot de passe",
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: (value) =>
                              controller.password.value = value,
                          validator: (value) {
                            if (value == null) {
                              return "Mot de passe obligatoire.";
                            }
                            return null;
                          },
                          obscureText: controller.obscureText.value,
                          suffix: GestureDetector(
                            onTap: () => controller.obscureText.value =
                                !controller.obscureText.value,
                            child: Icon(
                              controller.obscureText.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                          width: Get.width,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                foregroundColor: MAIN_COLOR,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () => controller.login(),
                            child: controller.loadingRequest.value
                                ? const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: MAIN_COLOR,
                                        strokeWidth: 2,
                                      ),
                                    ),
                                  )
                                : const Text(
                                    "Se connecter",
                                    style: TextStyle(fontFamily: "Poppins"),
                                  ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: GestureDetector(
                              onTap: () => Get.toNamed(Goo.registerScreen),
                              child: const Text(
                                "Mot de passe oublié?",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins",
                                    fontSize: 16),
                              )),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () => Get.toNamed(Goo.registerScreen),
                            child: RichText(
                                text: const TextSpan(children: [
                              TextSpan(
                                  text: "Vous avez un compte? ",
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(197, 255, 255, 255))),
                              TextSpan(
                                  text: " Créer un compte",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white))
                            ])),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
