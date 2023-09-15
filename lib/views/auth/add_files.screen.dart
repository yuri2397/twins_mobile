import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:twins/components/choos_files.widget.dart';
import 'package:twins/controllers/register.controller.dart';
import 'package:twins/routes/router.dart';
import 'package:twins/shared/utils/colors.dart';

class AddFielsScreen extends GetView<RegisterController> {
  const AddFielsScreen({super.key});

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
          () => Container(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Ajouter des photos",
                      style: TextStyle(
                          color: DARK_COLOR,
                          fontSize: 30,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 40,
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
                    onPressed: () => Get.toNamed(Goo.addBioScreen),
                    child: const Text("Suivant"),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget _buildItem(Rx<XFile> file) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: NEUTRAL_COLOR, width: 2),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white),
        child: Stack(
          children: [
            if (file.value.path.isNotEmpty)
              Positioned.fill(
                child: Image.file(
                  File(file.value.path),
                  fit: BoxFit.cover,
                ),
              ),
            Positioned(
              bottom: 6,
              right: 6,
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
