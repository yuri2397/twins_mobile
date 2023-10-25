import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:twinz/controllers/search.controller.dart' as lc;
import 'package:twinz/shared/utils/colors.dart';

class SearchDetails extends GetView<lc.SearchController> {
  const SearchDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: controller.detailsLoad.value
              ? const Center(
                  child: CircularProgressIndicator(color: MAIN_COLOR),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * .50,
                      width: Get.width,
                      child: controller.visibleUser.value.photos!.isEmpty
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                "",
                                fit: BoxFit.cover,
                              ),
                            )
                          : PageView.builder(
                              controller: controller.detailUserPhotosController,
                              itemCount:
                                  controller.visibleUser.value.photos?.length,
                              itemBuilder: (_, index) => ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  "${controller.visibleUser.value.photos?[index].url}",
                                  fit: BoxFit.cover,
                                ),
                              ).marginSymmetric(horizontal: 8),
                            ),
                    ),

                    Center(
                      child: SmoothPageIndicator(
                          controller: controller
                              .detailUserPhotosController, // PageController
                          count:
                              controller.visibleUser.value.photos?.length ?? 0,
                          effect: const WormEffect(
                              dotColor: NEUTRAL_COLOR,
                              activeDotColor: MAIN_COLOR,
                              dotWidth: 6,
                              dotHeight: 6), // your preferred effect
                          onDotClicked: (index) {}),
                    ).marginSymmetric(vertical: 18),

                    Text(
                      "${controller.visibleUser.value.fullName}, ${controller.visibleUser.value.age}"
                              .capitalizeFirst ??
                          "",
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                        color: MAIN_COLOR,
                        fontWeight: FontWeight.w700,
                        fontSize: 23,
                      ),
                    ),
                    SizedBox(
                      width: Get.width,
                      child: Text(
                          DateFormat.MMMMd('fr').format(
                              controller.visibleUser.value.birthDate ??
                                  DateTime.now()),
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                          style: TextStyle(color: DARK_COLOR, fontSize: 20)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(controller.visibleUser.value.bio ?? 'Bio',
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "Haylard")),

                    const SizedBox(
                      height: 5,
                    ),
                    // ville
                    Text(
                      controller.visibleUser.value.address ?? 'Ville',
                      style: const TextStyle(color: DARK_COLOR, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icons/position.svg",
                            color: DARK_COLOR),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${controller.visibleUser.value.distance} km",
                          style:
                              const TextStyle(color: DARK_COLOR, fontSize: 18),
                        ),
                      ],
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
      ),
    );
  }
}
