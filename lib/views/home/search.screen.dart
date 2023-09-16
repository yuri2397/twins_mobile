import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:twins/components/ui.dart';
import 'package:twins/controllers/home.controller.dart';
import 'package:twins/views/home/search/search_item.dart';

class SearchScreen extends GetView<HomeController> {
  final AppinioSwiperController swiperController = AppinioSwiperController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  itemIcon(CupertinoIcons.hand_thumbsup_fill),
                  itemIcon(CupertinoIcons.info_circle_fill),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * .8,
              width: Get.width,
              child: AppinioSwiper(
                swipeOptions: const AppinioSwipeOptions.only(left: true),
                unlimitedUnswipe: true,
                controller: swiperController,
                unswipe: _unswipe,
                onSwiping: (AppinioSwiperDirection direction) {
                  debugPrint(direction.toString());
                },
                onSwipe: _swipe,
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                  top: 10,
                  bottom: 40,
                ),
                onEnd: _onEnd,
                cardsCount: 10,
                cardsBuilder: (BuildContext context, int index) {
                  return SearchItemWidget(title: index.toString());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _swipe(int index, AppinioSwiperDirection direction) {
    Get.log("the card was swiped to the: " + direction.name);
  }

  void _unswipe(bool unswiped) {
    if (unswiped) {
      Get.log("SUCCESS: card was unswiped");
    } else {
      Get.log("FAIL: no card left to unswipe");
    }
  }

  void _onEnd() {
    Get.log("end reached!");
  }

  swipeLeftButton(AppinioSwiperController swiperController) {}

  swipeRightButton(AppinioSwiperController swiperController) {}

  unswipeButton(AppinioSwiperController swiperController) {}
}
