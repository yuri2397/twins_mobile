import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:twins/components/ui.dart';
import 'package:twins/controllers/search.controller.dart' as sc;
import 'package:twins/shared/utils/colors.dart';
import 'package:twins/views/home/search/search_item.dart';

class SearchScreen extends GetView<sc.SearchController> {
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
                  GestureDetector(
                    onTap: () => _showMore(),
                    child: itemIcon(CupertinoIcons.info_circle_fill),
                  ),
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
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.grey),
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
                  _detailUserPhotoItem(
                    "https://img.freepik.com/free-photo/portrait-young-businesswoman-holding-eyeglasses-hand-against-gray-backdrop_23-2148029483.jpg?w=740&t=st=1695565814~exp=1695566414~hmac=586f96c0ddffa502148f29cc2c29f896fbdea68863e1b18ff06b44a2f8923713",
                  ),
                  _detailUserPhotoItem(
                    "https://img.freepik.com/free-photo/portrait-young-businesswoman-holding-eyeglasses-hand-against-gray-backdrop_23-2148029483.jpg?w=740&t=st=1695565814~exp=1695566414~hmac=586f96c0ddffa502148f29cc2c29f896fbdea68863e1b18ff06b44a2f8923713",
                  ),
                  _detailUserPhotoItem(
                    "https://img.freepik.com/free-photo/portrait-young-businesswoman-holding-eyeglasses-hand-against-gray-backdrop_23-2148029483.jpg?w=740&t=st=1695565814~exp=1695566414~hmac=586f96c0ddffa502148f29cc2c29f896fbdea68863e1b18ff06b44a2f8923713",
                  ),
                  _detailUserPhotoItem(
                    "https://img.freepik.com/free-photo/portrait-young-businesswoman-holding-eyeglasses-hand-against-gray-backdrop_23-2148029483.jpg?w=740&t=st=1695565814~exp=1695566414~hmac=586f96c0ddffa502148f29cc2c29f896fbdea68863e1b18ff06b44a2f8923713",
                  ),
                  _detailUserPhotoItem(
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

  Widget _detailUserPhotoItem(String url) {
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
}
