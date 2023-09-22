import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twins/components/ui.dart';
import 'package:twins/controllers/search.controller.dart';
import 'package:twins/views/home/search/search_item.dart';

class SearchScreen extends GetView<SearchController> {
  const SearchScreen({super.key});

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
            Obx(
              () => SizedBox(
                height: Get.height * .8,
                width: Get.width,
                child: AppinioSwiper(
                  swipeOptions: const AppinioSwipeOptions.only(left: true),
                  unlimitedUnswipe: true,
                  controller: controller.swiperController,
                  onSwiping: (AppinioSwiperDirection direction) {
                  },
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
                        like: () =>
                            controller.onLike(controller.currentMatch[index]),
                        swipBack: () => controller
                            .onSwipBack(controller.currentMatch[index]),
                        cancel: () =>
                            controller.onCancel(controller.currentMatch[index]),
                        user: controller.currentMatch[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
