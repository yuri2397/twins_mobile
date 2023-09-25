import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
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
          child: Obx(() => Column(
              children: [
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            (controller.user.value?.profilePhoto != null && controller.user.value?.profilePhoto != "") ? controller.user.value!.profilePhoto! : "https://img.freepik.com/photos-gratuite/jeune-femme-chien-sans-abri-au-parc-photo-haute-qualite_144627-75703.jpg?w=740&t=st=1694874615~exp=1694875215~hmac=eb6804b67c1fc7b677babff8be1caaee8f4b47db541f6cfeb548f472371d555d",
                            height: 90,
                          ),
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
                                      fontSize: 20, fontWeight: FontWeight.bold),
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
                                        borderRadius: BorderRadius.circular(30))),
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
                        offset: const Offset(2, 3), // changes position of shadow
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
                          onChanged: (value) => controller.settingStatus.value = value,
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
              ],
            ),
          ),
        ));
  }
}
