import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:twins/controllers/profile.controller.dart';
import 'package:twins/routes/router.dart';
import 'package:twins/shared/utils/colors.dart';

class DetailProfileScreen extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Détails profil"),
          elevation: 0,
        ),
        body: Stack(
          fit: StackFit.loose,
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: (Get.height * .12), right: 20, left: 20, bottom: 10),
              padding: const EdgeInsets.all(20),
              height: Get.height * .7,
              width: Get.width,
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
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  ListTile(
                    title: const Text("Nom",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 18,
                        )),
                    trailing: Text(
                      "${controller.user.value?.fullName}",
                      style: const TextStyle(
                          color: DARK_COLOR,
                          fontFamily: "Poppins",
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Divider(
                    color: NEUTRAL_COLOR,
                  ),
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
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Divider(
                    color: NEUTRAL_COLOR,
                  ),
                  ListTile(
                    title: const Text("Téléphone",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 18,
                        )),
                    trailing: Text(
                      "${controller.user.value?.phoneNumber}",
                      style: const TextStyle(
                          color: DARK_COLOR,
                          fontFamily: "Poppins",
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Divider(
                    color: NEUTRAL_COLOR,
                  ),
                  ListTile(
                    title: const Text("Sexe",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 18,
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
                  const Divider(
                    color: NEUTRAL_COLOR,
                  ),
                  ListTile(
                    title: const Text("Date de naiss.",
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 18,
                        )),
                    trailing: Text(
                      DateFormat.yMMMd('fr')
                          .format(controller.user.value?.birthDate ?? DateTime.now()),
                      style: const TextStyle(
                          color: DARK_COLOR,
                          fontFamily: "Poppins",
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () => Get.toNamed(Goo.updateProfileScreen),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: MAIN_COLOR,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: const Text("Modifier"))
                ],
              ),
            ),
            Positioned(
              top: Get.height * .05,
              left: Get.width * .5 - 50,
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: NEUTRAL_COLOR,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 20,
                          offset:
                              const Offset(2, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        controller.user.value?.profilePhoto ??
                            "https://images.placeholders.dev/?width=800&height=800&text=Twins&bgColor=%23f7f6f6&textColor=%236d6e71",
                        height: 100,
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(Goo.addFilesScreen);
                        },
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.add_rounded,
                            color: MAIN_COLOR,
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
