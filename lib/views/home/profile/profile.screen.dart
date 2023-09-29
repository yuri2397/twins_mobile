import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:twins/components/choose_files.widget.dart';
import 'package:twins/components/ui.dart';
import 'package:twins/controllers/home.controller.dart';
import 'package:twins/controllers/profile.controller.dart';
import 'package:twins/routes/router.dart';
import 'package:twins/shared/utils/colors.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 200,
                  child: Stack(
                    children: [
                      Container(
                        height: 150,
                        width: Get.width,
                        color: MAIN_COLOR,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: NEUTRAL_COLOR),
                              borderRadius: BorderRadius.circular(100)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              (controller.user.value?.profilePhoto != null &&
                                      controller.user.value?.profilePhoto != "")
                                  ? controller.user.value!.profilePhoto!
                                  : "https://img.freepik.com/photos-gratuite/jeune-femme-chien-sans-abri-au-parc-photo-haute-qualite_144627-75703.jpg?w=740&t=st=1694874615~exp=1694875215~hmac=eb6804b67c1fc7b677babff8be1caaee8f4b47db541f6cfeb548f472371d555d",
                              fit: BoxFit.cover,
                              height: 100,
                              width: 100,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "${controller.user.value?.fullName}, ${controller.user.value?.age}",
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.circle, color: MAIN_COLOR, size: 20),
                        Text("A propos de vous",
                            style: TextStyle(
                              color: DARK_COLOR.withOpacity(0.6),
                              fontSize: 18,
                            )).marginOnly(left: 10),
                      ],
                    ).marginOnly(bottom: 20),
                    Container(
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: const Offset(
                                  1, 1), // changes position of shadow
                            ),
                          ],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Text(
                          controller.user.value?.bio ?? 'bio',
                          style: const TextStyle(color: DARK_COLOR),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        const Icon(Icons.circle, color: MAIN_COLOR, size: 20),
                        Text("Mes infos perso",
                            style: TextStyle(
                              color: DARK_COLOR.withOpacity(0.6),
                              fontSize: 18,
                            )).marginOnly(left: 10),
                      ],
                    ).marginOnly(bottom: 20),
                    Container(
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: const Offset(
                                  1, 1), // changes position of shadow
                            ),
                          ],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              title: const Text("Email",
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 18,
                                  )),
                              trailing: Text(
                                "${controller.user.value?.email}",
                                style: const TextStyle(
                                    color: DARK_COLOR,
                                    fontFamily: "Poppins",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),


                            ListTile(
                              title: const Text("Sexe",
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 16,
                                  )),
                              trailing: Text(
                                controller.user.value?.gender == 'male'
                                    ? 'Masculin'
                                    : 'Fénimin',
                                style: const TextStyle(
                                    color: DARK_COLOR,
                                    fontFamily: "Poppins",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),

                            ListTile(
                              title: const Text("Date de naiss.",
                                  style: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 16,
                                  )),
                              trailing: Text(
                                DateFormat.yMMMd('fr')
                                    .format(controller.user.value?.birthDate ?? DateTime.now()),
                                style: const TextStyle(
                                    color: DARK_COLOR,
                                    fontFamily: "Poppins",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 30,
                    ), Row(
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        const Icon(Icons.circle, color: MAIN_COLOR, size: 20),
                        Text("Mon compte",
                            style: TextStyle(
                              color: DARK_COLOR.withOpacity(0.6),
                              fontSize: 18,
                            )).marginOnly(left: 10),
                      ],
                    ).marginOnly(bottom: 20),

                    Container(
                        width: Get.width,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: const Offset(
                                  1, 1), // changes position of shadow
                            ),
                          ],
                          borderRadius:
                          const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                                onTap: () => controller.logout(),

                                title: const Text("Déconnexion",
                                    style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 18,
                                    )),
                                trailing:const Icon(Icons.arrow_forward_ios_sharp),
                            ),
                            ListTile(
                              onTap: () => controller.disabledAccount(),
                              title: const Text("Désactiver",
                                  style: TextStyle(
                                    color: Colors.pink,
                                    fontSize: 18,
                                  )),
                              trailing: const Icon(Icons.arrow_forward_ios_sharp)
                            ),
                            ListTile(
                                title: const Text("Supprimer",
                                    style: TextStyle(
                                      color: Colors.pink,
                                      fontSize: 18,
                                    )),
                                trailing:GestureDetector( child: const Icon(Icons.arrow_forward_ios_sharp),)
                            ),

                          ],
                        )),
                  ],
                ).paddingSymmetric(horizontal: 20)
              ],
            ),
          ),
        ));
  }

  /*

   SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                (controller.user.value?.profilePhoto != null &&
                                        controller.user.value?.profilePhoto !=
                                            "")
                                    ? controller.user.value!.profilePhoto!
                                    : "https://img.freepik.com/photos-gratuite/jeune-femme-chien-sans-abri-au-parc-photo-haute-qualite_144627-75703.jpg?w=740&t=st=1694874615~exp=1694875215~hmac=eb6804b67c1fc7b677babff8be1caaee8f4b47db541f6cfeb548f472371d555d",
                                fit: BoxFit.cover,
                                height: 100,
                                width: 100,
                              ),
                            ),
                            Positioned(
                                bottom: -3,
                                right: -3,
                                child: GestureDetector(
                                  onTap: () async {
                                    XFile? file = await takeImage();
                                    if (file != null && file.path.isNotEmpty) {
                                      _previewChoosedImage(file);
                                    }
                                  },
                                  child: const CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.add_a_photo,
                                        color: MAIN_COLOR,
                                      )),
                                ))
                          ],
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${controller.user.value?.fullName}",
                                  style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                                const Icon(
                                  CupertinoIcons.right_chevron,
                                  color: NEUTRAL_COLOR,
                                )
                              ],
                            ),
                            ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: MAIN_COLOR,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 2),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))),
                                onPressed: () =>
                                    Get.toNamed(Goo.detailsProfileScreen),
                                icon: const Icon(
                                    CupertinoIcons.person_circle_fill,
                                    size: 18),
                                label: const Text("Voir détails",
                                    style: TextStyle(fontSize: 13)))
                          ],
                        ).marginOnly(left: 20),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: Get.width,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 20,
                        offset:
                            const Offset(2, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      ListTile(
                        title: const Text(
                          "Recevoir les notifications",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        leading: itemIcon(Icons.notifications),
                        trailing: Switch(
                          onChanged: (value) {},
                          value: false,
                          activeColor: MAIN_COLOR,
                        ),
                      ),
                      ListTile(
                        title: const Text(
                          "Localisation",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        leading: itemIcon(CupertinoIcons.location_fill),
                        trailing: Switch(
                          onChanged: (value) =>
                              controller.settingStatus.value = value,
                          value: controller.settingStatus.value,
                          activeColor: MAIN_COLOR,
                        ),
                      ),
                      ListTile(
                        onTap: () => Get.toNamed(Goo.settingScreen),
                        title: const Text(
                          "Paramétres",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        leading: itemIcon(CupertinoIcons.settings_solid),
                        trailing: const Icon(CupertinoIcons.chevron_right,
                            color: NEUTRAL_COLOR),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListTile(
                        title: const Text(
                          "Centre d'aide",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        leading: itemIcon(Icons.support_agent_rounded),
                        trailing: const Icon(CupertinoIcons.chevron_right,
                            color: NEUTRAL_COLOR),
                      ),
                      ListTile(
                        title: const Text(
                          "A propos",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        leading: itemIcon(Icons.info_rounded),
                        trailing: const Icon(CupertinoIcons.chevron_right,
                            color: NEUTRAL_COLOR),
                      ),
                      ListTile(
                        onTap: () => controller.logout(),
                        title: const Text(
                          "Se déconnecter",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        leading: itemIcon(Icons.logout_sharp),
                        trailing: const Icon(CupertinoIcons.chevron_right,
                            color: NEUTRAL_COLOR),
                      ),
                      ListTile(
                        title: const Text(
                          "Supprimer mon compte",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        leading: itemIcon(CupertinoIcons.trash_fill),
                        trailing: const Icon(CupertinoIcons.chevron_right,
                            color: NEUTRAL_COLOR),
                      ),
                    ],
                  ),
                )
   */

  _previewChoosedImage(XFile file) {
    var loader = false.obs;
    Get.bottomSheet(
        Obx(
          () => Container(
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
                      File(file.path),
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
                      icon: const Icon(Icons.check_circle),
                      onPressed: () async {
                        loader.value = true;
                        loader.refresh();
                        await controller.updateProfilePhoto(file);
                        loader.value = false;
                        loader.refresh();
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: MAIN_COLOR,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                      label: loader.value
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3,
                              ),
                            )
                          : const Text("Valider"),
                    ).marginOnly(right: 10),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.pink,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                      label: const Text("Annuler"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        isScrollControlled: true,
        isDismissible: false);
  }
}
