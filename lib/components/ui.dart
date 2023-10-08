import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:twins/core/model/user.dart';
import 'package:twins/shared/utils/colors.dart';

errorMessage(
    {required String title, required String content, SnackPosition? position}) {
  Get.snackbar(title, content,
      colorText: Colors.white,
      backgroundColor: Colors.redAccent,
      snackPosition: position ?? SnackPosition.TOP,
      borderRadius: 20,
      icon: const Icon(
        Icons.error_outline,
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10));
}

successMessage(
    {required String title, required String content, SnackPosition? position}) {
  Get.snackbar(title, content,
      colorText: Colors.white,
      backgroundColor: Colors.green,
      snackPosition: position ?? SnackPosition.TOP,
      borderRadius: 20,
      icon: const Icon(
        Icons.error_outline,
        color: Colors.white,
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10));
}

infoMessage({required String title, required String content}) {}

warningMessage({required String title, required String content}) {}

itemIcon(IconData icon, {Color? backgroundColor, Color? color, double? size}) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color:backgroundColor?? Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 20,
          offset: const Offset(2, 3), // changes position of shadow
        ),
      ],
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    ),
    child: Icon(
      icon,
      color:color?? MAIN_COLOR,
      size: size ?? 25,
    ),
  );
}


Widget hr(){
  return Container(
    alignment: Alignment.center,
    margin: const EdgeInsets.all(20),
    height: 8,
    width: Get.width * .2,
    decoration:  BoxDecoration ( color: NEUTRAL_COLOR, borderRadius: BorderRadius.circular(20)),);
}

showUserDetails(User user) {
  Get.bottomSheet(Container(
    decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: hr()),
        Row(
          children: [
            Text(
              "${user.fullName}, ${user.age} ans",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              width: 30,
            ),
            const Icon(
              CupertinoIcons.check_mark_circled,
              color: MAIN_COLOR,
            ),

          ],
        ).marginOnly(bottom: 10, left: 20, top: 8),
        Row(
          children: [
            itemIcon(Icons.map_rounded),
            const SizedBox( width: 10,),
            const Text(
              "Dakar • 24km",
              style:  TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.grey),
            )
          ],
        ).marginOnly(bottom: 10, left: 20),
        const Divider( color: NEUTRAL_COLOR, height: 2,).marginAll(20),

        SizedBox(
          height: 130,
          width: Get.width,
          child:Skeletonizer(
            enabled: true,
            ignoreContainers: true,
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              children: [
                detailUserPhotoItem(
                  "https://img.freepik.com/free-photo/portrait-young-businesswoman-holding-eyeglasses-hand-against-gray-backdrop_23-2148029483.jpg?w=740&t=st=1695565814~exp=1695566414~hmac=586f96c0ddffa502148f29cc2c29f896fbdea68863e1b18ff06b44a2f8923713",
                ),
                detailUserPhotoItem(
                  "https://img.freepik.com/free-photo/portrait-young-businesswoman-holding-eyeglasses-hand-against-gray-backdrop_23-2148029483.jpg?w=740&t=st=1695565814~exp=1695566414~hmac=586f96c0ddffa502148f29cc2c29f896fbdea68863e1b18ff06b44a2f8923713",
                ),
                detailUserPhotoItem(
                  "https://img.freepik.com/free-photo/portrait-young-businesswoman-holding-eyeglasses-hand-against-gray-backdrop_23-2148029483.jpg?w=740&t=st=1695565814~exp=1695566414~hmac=586f96c0ddffa502148f29cc2c29f896fbdea68863e1b18ff06b44a2f8923713",
                ),
                detailUserPhotoItem(
                  "https://img.freepik.com/free-photo/portrait-young-businesswoman-holding-eyeglasses-hand-against-gray-backdrop_23-2148029483.jpg?w=740&t=st=1695565814~exp=1695566414~hmac=586f96c0ddffa502148f29cc2c29f896fbdea68863e1b18ff06b44a2f8923713",
                ),
                detailUserPhotoItem(
                  "https://img.freepik.com/free-photo/portrait-young-businesswoman-holding-eyeglasses-hand-against-gray-backdrop_23-2148029483.jpg?w=740&t=st=1695565814~exp=1695566414~hmac=586f96c0ddffa502148f29cc2c29f896fbdea68863e1b18ff06b44a2f8923713",
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 40,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => {},
              child: Container(
                padding: const EdgeInsets.all(8),
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
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
                child: const Icon(
                  Icons.close,
                  color: DARK_COLOR,
                  size: 50,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => {},
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: MAIN_COLOR,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 20,
                      offset:
                      const Offset(2, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
                child: const Icon(
                  CupertinoIcons.heart_fill,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
          ],
        )
      ],
    ),
  ));
}

Widget detailUserPhotoItem(String url) {
  return Container(
    height: 100,
    width: 120,
    margin: const EdgeInsets.all(6),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: NEUTRAL_COLOR,
          spreadRadius: .1,
          blurRadius: 1,
          offset: Offset(2, 2), // changes position of shadow
        ),
      ],
      borderRadius: BorderRadius.circular(20),
    ),
    child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          url,
          fit: BoxFit.cover,
        )),
  );
}