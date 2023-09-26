import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twins/components/choose_files.widget.dart';
import 'package:twins/controllers/profile.controller.dart';
import 'package:twins/controllers/register.controller.dart';
import 'package:twins/routes/router.dart';
import 'package:twins/shared/utils/colors.dart';

class AddFilesScreen extends GetView<ProfileController> {
  const AddFilesScreen({super.key});

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
      body: Obx(
        () => RefreshIndicator(
          color: MAIN_COLOR,
          onRefresh: () => Future.sync(() async => controller.photos()),
          child: SingleChildScrollView(
            child: Container(
              height: Get.height,
              width: Get.width,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Ajouter vos photos",
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
                        "Votre adresse e-mail sera utilisée à des fins de sécurité, comme vous aider à récupérer l'accès à votre compte si vous oubliez un jour votre mot de passe.",
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
                      GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 3,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 8,
                        children: controller.files
                            .map((element) => _buildItem(element))
                            .toList(),
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
                      onPressed: () => controller.addPhotos(),
                      child: controller.addPhotoLoad.value
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                  color: Colors.white))
                          : const Text("Enrégistrer"),
                    ),
                  )
                ],
              ).paddingAll(20),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(Rx<XFile> file) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: NEUTRAL_COLOR, width: 2),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white),
        child: Stack(
          children: [
            file.value.path.isNotEmpty
                ? Positioned.fill(
                    child: Image.file(
                      File(file.value.path),
                      fit: BoxFit.cover,
                    ),
                  )
                : Container(
                    color: NEUTRAL_COLOR,
                    child: Center(
                        child: SvgPicture.asset(
                      "assets/images/preview.svg",
                      width: 50,
                    ))),
            Positioned(
              bottom: 5,
              right: 5,
              child: file.value.path.isEmpty
                  ? GestureDetector(
                      onTap: () async {
                        file.value = await takeImage() ?? XFile("");
                        file.refresh();
                      },
                      child: const CircleAvatar(
                        backgroundColor: MAIN_COLOR,
                        radius: 14,
                        child: Icon(Icons.add, color: Colors.white, size: 15),
                      ),
                    )
                  : GestureDetector(
                      onTap: () => _editFile(file),
                      child: const CircleAvatar(
                        backgroundColor: MAIN_COLOR,
                        radius: 14,
                        child: Icon(Icons.edit, color: Colors.white, size: 15),
                      ),
                    ),
            )
          ],
        ));
  }

  _editFile(Rx<XFile> file) {
    Get.bottomSheet(
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  width: Get.height * .5,
                  child: Image.file(
                    File(file.value.path),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.edit),
                    onPressed: () async {
                      Get.back();
                      file.value = await takeImage() ?? XFile("");
                      file.refresh();
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: MAIN_COLOR,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    label: const Text("Modifier"),
                  ).marginOnly(right: 10),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () {
                      file.value = XFile("");
                      Get.back();
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.pink,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    label: const Text("Supprimer"),
                  ),
                ],
              )
            ],
          ),
        ),
        isScrollControlled: true);
  }
}
