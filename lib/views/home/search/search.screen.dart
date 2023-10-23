import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:twinz/components/ui.dart';
import 'package:twinz/controllers/search.controller.dart' as sc;
import 'package:twinz/core/config/env.dart';
import 'package:twinz/core/utils/utils.dart';
import 'package:twinz/routes/router.dart';
import 'package:twinz/shared/utils/colors.dart';
import 'package:twinz/views/home/search/search_item.dart';

class SearchScreen extends GetView<sc.SearchController> {
  SearchScreen({super.key});
  final drawerKey = GlobalKey<DrawerControllerState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: MAIN_COLOR,
          elevation: 0,
          leading: GestureDetector(
            onTap: () => scaffoldKey.currentState?.openDrawer(),
            child: const Icon(Icons.menu, color: Colors.white),
          ),
          title: Image.asset(
            Env.whiteLogo,
            width: 45,
          ),
        ),
        drawer: drawer(drawerKey: drawerKey, scaffoldKey: scaffoldKey),
        body: SafeArea(
          child: Obx(() => controller.matchLoad.value
              ? const Center(
                  child: CircularProgressIndicator(color: MAIN_COLOR),
                )
              : localStorage.getUser()?.active == "1"
                  ? controller.matchSuccess.value
                      ? !controller.subscribeForPremium.value
                          ? Matcher(controller: controller)
                          : Center(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Vous avez atteint la limite de suggestions de profils, passez à Twinz Premium pour voir d'avantage ou patientez 48h.Veuillez changer votre offre à Premium.",
                                      textAlign: TextAlign.center,
                                    ).marginSymmetric(horizontal: 20),
                                    ElevatedButton(
                                            onPressed: () =>
                                                Get.toNamed(Goo.offerScreen),
                                            style: ElevatedButton.styleFrom(
                                                elevation: 0,
                                                backgroundColor: MAIN_COLOR,
                                                foregroundColor: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    side: const BorderSide(
                                                        color: Colors.white,
                                                        width: 1.5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20))),
                                            child: const Text(
                                                "Passez à Twinz Premimium"))
                                        .marginOnly(top: 20),
                                  ]),
                            )
                      : Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text("Oups !!",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: "Poppins",
                                            fontWeight: FontWeight.w700))
                                    .marginOnly(bottom: 10),
                                const Text(
                                  "Aucun match trouvé. Merci de\nrevoir vos paramètres.",
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  width: Get.width * .5,
                                  child: ElevatedButton(
                                      onPressed: () =>
                                          controller.getMatchings(),
                                      style: ElevatedButton.styleFrom(
                                          elevation: 0,
                                          backgroundColor: MAIN_COLOR,
                                          foregroundColor: Colors.white,
                                          shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  color: Colors.white,
                                                  width: 1.5),
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                      child: const Text("Relancer")),
                                ).marginOnly(top: 20),
                              ]),
                        )
                  : _activeAccount()),
        ));
  }

  Center _activeAccount() {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Oups !!",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700))
                .marginOnly(bottom: 10),
            const Text(
              "Votre compte a été désactiver.\n Veuillez réactiver votre compte pour continuer.",
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: Get.width * .5,
              child: ElevatedButton(
                  onPressed: () => controller.activeAccount(),
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: MAIN_COLOR,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          side:
                              const BorderSide(color: Colors.white, width: 1.5),
                          borderRadius: BorderRadius.circular(20))),
                  child: const Text("Activer mon compte")),
            ).marginOnly(top: 20),
          ]),
    );
  }

  _showMore() {
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
                "${controller.visibleUser.value.fullName}, ${controller.visibleUser.value.age} ans",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
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
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Dakar • 24km",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              )
            ],
          ).marginOnly(bottom: 10, left: 20),
          const Divider(
            color: NEUTRAL_COLOR,
            height: 2,
          ).marginAll(20),
          SizedBox(
            height: 130,
            width: Get.width,
            child: Skeletonizer(
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
          const SizedBox(
            height: 40,
          ),
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
}

class Matcher extends StatelessWidget {
  const Matcher({
    super.key,
    required this.controller,
  });

  final sc.SearchController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              controller.visibleUser.value.photosCount ?? 0,
              (index) => const Icon(Icons.circle, color: MAIN_COLOR, size: 6)
                  .marginSymmetric(horizontal: 6)),
        ).marginSymmetric(vertical: 10),
        SizedBox(
          height: Get.height * .70,
          width: Get.width,
          child: AppinioSwiper(
            swipeOptions:
                const AppinioSwipeOptions.only(left: true, right: true),
            unlimitedUnswipe: true,
            controller: controller.swiperController,
            backgroundCardsCount: 0,
            onSwiping: (AppinioSwiperDirection direction) {
              if (direction == AppinioSwiperDirection.left) {
                controller.onSwipBack(controller.visibleUser.value);
              }
              if (direction == AppinioSwiperDirection.right) {
                controller.onLike(controller.visibleUser.value);
              }
            },
            onSwipe: controller.swipe,
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 10,
            ),
            cardsCount: controller.currentMatch.length,
            cardsBuilder: (BuildContext context, int index) {
              return SearchItemWidget(user: controller.currentMatch[index]);
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () => controller.onCancel(controller.visibleUser.value),
              child: Container(
                padding: const EdgeInsets.all(8),
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
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.pink,
                  size: 35,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => controller.onSwipBack(controller.visibleUser.value),
              child: Container(
                padding: const EdgeInsets.all(8),
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
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
                child: const Icon(
                  Icons.undo,
                  color: Colors.orange,
                  size: 25,
                ),
              ),
            ).marginOnly(top: 10),
            GestureDetector(
              onTap: () => controller.onLike(controller.visibleUser.value),
              child: Container(
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
                  borderRadius: const BorderRadius.all(Radius.circular(50)),
                ),
                child: Image.asset(
                  Env.whiteLogo,
                  width: 50,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
