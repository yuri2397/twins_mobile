import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twins/controllers/register.controller.dart';
import 'package:twins/routes/router.dart';
import 'package:twins/shared/utils/colors.dart';

import '../../components/choose_files.widget.dart';

class AddAvatarScreen extends GetView<RegisterController> {
  AddAvatarScreen({super.key});

  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
                      "Ajouter une Photo",
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
                      "Téléchargez une image de vous-même pour personnaliser et donner vie à votre profil.",
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
                    Stack(
                      children: [
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: MAIN_COLOR),
                          child: controller.avatarFile.value.path.isNotEmpty
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.file(
                                    File(controller.avatarFile.value.path),
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : SvgPicture.asset(
                                  "assets/images/avatar.svg",
                                ),
                        ),
                        Positioned(
                            bottom: 1,
                            right: 0,
                            child: GestureDetector(
                                onTap: () async {
                                  controller.avatarFile.value =
                                      await takeImage() ?? XFile("");
                                  controller.avatarFile.refresh();
                                },
                                child: const CircleAvatar(
                                  radius: 25,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.add_a_photo,
                                      size: 25, color: MAIN_COLOR),
                                ))),
                      ],
                    )
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
                      if (controller.avatarFile.value.path.isNotEmpty) {
                        controller.save();
                      }
                    },
                    child: controller.loading.value
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ))
                        : const Text("Enrégistrer"),
                  ),
                ),
              ],
            ).paddingAll(20),
          )),
    );
  }
}
