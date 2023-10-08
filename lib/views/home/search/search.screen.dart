import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:twins/components/ui.dart';
import 'package:twins/controllers/search.controller.dart' as sc;
import 'package:twins/core/config/env.dart';
import 'package:twins/routes/router.dart';
import 'package:twins/shared/utils/colors.dart';
import 'package:twins/views/home/search/search_item.dart';

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
          width: 50,
        ),
      ),
      drawer: _drawer(),
      body: SafeArea(
        child: Obx(
          () => controller.matchLoad.value
              ? const Center(
                  child: CircularProgressIndicator(color: MAIN_COLOR),
                )
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          controller.visibleUser.value.photosCount ?? 0,
                          (index) => const Icon(Icons.circle,
                                  color: MAIN_COLOR, size: 6)
                              .marginSymmetric(horizontal: 6)),
                    ).marginSymmetric(vertical: 10),
                    SizedBox(
                      height: Get.height - 180,
                      width: Get.width,
                      child: AppinioSwiper(
                        swipeOptions:
                            const AppinioSwipeOptions.only(left: true),
                        unlimitedUnswipe: true,
                        controller: controller.swiperController,
                        backgroundCardsCount: 0,
                        onSwiping: (AppinioSwiperDirection direction) {},
                        onSwipe: controller.swipe,
                        padding: const EdgeInsets.only(
                          left: 25,
                          right: 25,
                          top: 10,
                          bottom: 40,
                        ),
                        cardsCount: controller.currentMatch.length,
                        cardsBuilder: (BuildContext context, int index) {
                          return SearchItemWidget(
                              like: () => controller
                                  .onLike(controller.currentMatch[index]),
                              swipBack: () => controller
                                  .onSwipBack(controller.currentMatch[index]),
                              cancel: () => controller
                                  .onCancel(controller.currentMatch[index]),
                              user: controller.currentMatch[index]);
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ),
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

  _drawer() {
    return Drawer(
      key: drawerKey,
      child: ListView(
        children: [
          ListTile(
            leading: itemIcon(Icons.close, color: Colors.black),
            title: const Text("Menu",
                style: TextStyle(
                    fontSize: 20, color: Colors.black, fontFamily: "Poppins")),
            onTap: () => scaffoldKey.currentState?.closeDrawer(),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            color: NEUTRAL_COLOR,
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading:
                itemIcon(Icons.person_outline_rounded, color: Colors.black),
            title: const Text("Profil",
                style: TextStyle(
                    fontSize: 20, color: Colors.black, fontFamily: "Poppins")),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () => Get.toNamed(Goo.offerScreen),
            leading: itemIcon(Icons.payment_outlined, color: Colors.black),
            title: const Text("Twinz premium",
                style: TextStyle(
                    fontSize: 20, color: Colors.black, fontFamily: "Poppins")),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () => Get.toNamed(Goo.settingScreen),
            leading: itemIcon(Icons.settings_outlined, color: Colors.black),
            title: const Text("Réglages",
                style: TextStyle(
                    fontSize: 20, color: Colors.black, fontFamily: "Poppins")),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: itemIcon(Icons.security_outlined, color: Colors.black),
            title: const Text("Confidentialité",
                style: TextStyle(
                    fontSize: 20, color: Colors.black, fontFamily: "Poppins")),
          )
        ],
      ).paddingSymmetric(vertical: 40, horizontal: 20),
    );
  }
}
