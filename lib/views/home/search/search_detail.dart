import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:twins/controllers/search.controller.dart' as lc;
import 'package:twins/shared/utils/colors.dart';

class SearchDetails extends GetView<lc.SearchController> {
  const SearchDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Align(
            //         alignment: Alignment.topRight,
            //         child: itemIcon(CupertinoIcons.info_circle_fill))
            //     .marginOnly(bottom: 12),
            SizedBox(
              height: Get.height * .65,
              width: Get.width,
              child: PageView(
                  controller: controller.detailUserPhotosController,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        (controller.visibleUser.value.profilePhoto != null &&
                                controller.visibleUser.value.profilePhoto != "")
                            ? controller.visibleUser.value.profilePhoto!
                            : "https://img.freepik.com/photos-gratuite/jeune-femme-chien-sans-abri-au-parc-photo-haute-qualite_144627-75703.jpg?w=740&t=st=1694874615~exp=1694875215~hmac=eb6804b67c1fc7b677babff8be1caaee8f4b47db541f6cfeb548f472371d555d",
                        fit: BoxFit.cover,
                      ),
                    ).marginSymmetric(horizontal: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        (controller.visibleUser.value.profilePhoto != null &&
                                controller.visibleUser.value.profilePhoto != "")
                            ? controller.visibleUser.value.profilePhoto!
                            : "https://img.freepik.com/photos-gratuite/jeune-femme-chien-sans-abri-au-parc-photo-haute-qualite_144627-75703.jpg?w=740&t=st=1694874615~exp=1694875215~hmac=eb6804b67c1fc7b677babff8be1caaee8f4b47db541f6cfeb548f472371d555d",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ]),
            ),

            Center(
              child: SmoothPageIndicator(
                  controller:
                      controller.detailUserPhotosController, // PageController
                  count: 2,
                  effect: const WormEffect(
                      dotColor: NEUTRAL_COLOR,
                      activeDotColor: MAIN_COLOR,
                      dotWidth: 12,
                      dotHeight: 12), // your preferred effect
                  onDotClicked: (index) {}),
            ).marginSymmetric(vertical: 18),

            Text(
              "${controller.visibleUser.value.fullName}, ${controller.visibleUser.value.age}"
                      .capitalizeFirst ??
                  "",
              overflow: TextOverflow.fade,
              style: const TextStyle(
                color: DARK_COLOR,
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
            ),
            SizedBox(
              width: Get.width,
              child: Text(
                  DateFormat.MMMMd('fr').format(
                      controller.visibleUser.value.birthDate ?? DateTime.now()),
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.4), fontSize: 18)),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: Get.width,
              height: 60,
              child: Text(
                  controller.visibleUser.value.bio ??
                      'Bio ===================================================================================================',
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(color: Colors.black.withOpacity(0.5))),
            ),
            const SizedBox(
              height: 5,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     GestureDetector(
            //       onTap: () => widget.cancel(),
            //       child: Container(
            //         padding: const EdgeInsets.all(8),
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           boxShadow: [
            //             BoxShadow(
            //               color: Colors.black.withOpacity(0.2),
            //               spreadRadius: 1,
            //               blurRadius: 20,
            //               offset:
            //                   const Offset(2, 3), // changes position of shadow
            //             ),
            //           ],
            //           borderRadius: const BorderRadius.all(Radius.circular(50)),
            //         ),
            //         child: const Icon(
            //           Icons.close,
            //           color: Colors.pink,
            //           size: 35,
            //         ),
            //       ),
            //     ),
            //     GestureDetector(
            //       onTap: () => widget.swipBack(),
            //       child: Container(
            //         padding: const EdgeInsets.all(8),
            //         decoration: BoxDecoration(
            //           color: Colors.white,
            //           boxShadow: [
            //             BoxShadow(
            //               color: Colors.black.withOpacity(0.2),
            //               spreadRadius: 1,
            //               blurRadius: 20,
            //               offset:
            //                   const Offset(2, 3), // changes position of shadow
            //             ),
            //           ],
            //           borderRadius: const BorderRadius.all(Radius.circular(50)),
            //         ),
            //         child: const Icon(
            //           Icons.undo,
            //           color: Colors.yellowAccent,
            //           size: 25,
            //         ),
            //       ),
            //     ).marginOnly(top: 10),
            //     GestureDetector(
            //       onTap: () => widget.like(),
            //       child: Container(
            //         padding: const EdgeInsets.all(8),
            //         decoration: BoxDecoration(
            //           color: MAIN_COLOR,
            //           boxShadow: [
            //             BoxShadow(
            //               color: Colors.black.withOpacity(0.2),
            //               spreadRadius: 1,
            //               blurRadius: 20,
            //               offset:
            //                   const Offset(2, 3), // changes position of shadow
            //             ),
            //           ],
            //           borderRadius: const BorderRadius.all(Radius.circular(50)),
            //         ),
            //         child: Image.asset(
            //           Env.whiteLogo,
            //           width: 35,
            //         ),
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
