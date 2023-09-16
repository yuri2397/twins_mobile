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
                      "${controller.user?.fullName}",
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
                      "${controller.user?.email}",
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
                      "${controller.user?.phoneNumber}",
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
                      controller.user?.gender == 'male'
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
                          .format(controller.user?.birthDate ?? DateTime.now()),
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
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: NEUTRAL_COLOR,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 20,
                      offset: const Offset(2, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(100),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    "https://img.freepik.com/free-photo/portrait-young-businesswoman-holding-eyeglasses-hand-against-gray-backdrop_23-2148029483.jpg?w=740&t=st=1694816532~exp=1694817132~hmac=09953c455aef36f7436fcf1aafa10fe5b3d4d69cd0f8ec2b82963603a6f5dddd",
                    height: 100,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
