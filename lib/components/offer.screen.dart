import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:twinz/controllers/offer.controller.dart';
import 'package:twinz/shared/utils/colors.dart';

class OfferScreen extends GetView<OfferController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: MAIN_COLOR,
          elevation: 0,
          leading: GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(Icons.arrow_back_ios, color: Colors.white)),
        ),
        body: controller.offerLoad.value
            ? const Center(
                child: CircularProgressIndicator(color: MAIN_COLOR),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Abonnement",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: MAIN_COLOR,
                        fontSize: 30,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "L'achat se fait en un paiement unique sans renouvellement automatique. Vous ne serez donc pas débité(e) en dehors de votre période d'abonnement, sauf si vous choisissez de le renouveler par vous-même.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: DARK_COLOR, fontFamily: "Poppins", fontSize: 16),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () =>
                            controller.choosePlan(controller.offers[1]),
                        child: Container(
                          width: Get.width * .3,
                          height: 170,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: GRAY_COLOR, width: 2),
                          ),
                          child: Column(
                            children: [
                              Text("${controller.offers[1].duration} Jours",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20)),
                              Text("${controller.offers[1].description}",
                                  textAlign: TextAlign.center),
                              Text(
                                "${controller.offers[1].price} €",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            controller.choosePlan(controller.offers[2]),
                        child: Container(
                          width: Get.width * .3,
                          height: 170,
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: MAIN_COLOR, width: 2),
                          ),
                          child: Column(
                            children: [
                              Text("${controller.offers[2].duration} Jours",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20)),
                              Text("${controller.offers[2].description}",
                                  textAlign: TextAlign.center),
                              Text(
                                "${controller.offers[2].price} €",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            controller.choosePlan(controller.offers[0]),
                        child: Container(
                          width: Get.width * .3,
                          height: 170,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 10),
                          margin: const EdgeInsets.symmetric(horizontal: 2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: GRAY_COLOR, width: 2),
                          ),
                          child: Column(
                            children: [
                              Text("${controller.offers[0].duration} Jours",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20)),
                              Text(
                                "${controller.offers[0].description}",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "${controller.offers[0].price} €",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (controller.load.value)
                    const SizedBox(
                      child: Center(
                        child: CircularProgressIndicator(color: MAIN_COLOR),
                      ),
                    ).marginOnly(top: 50)

                  /* SizedBox(
                width: Get.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: MAIN_COLOR,
                      foregroundColor: Colors.white),
                  onPressed: (){},
                  child: const Text("Enregistrer"),
                ),
              )*/
                ],
              ).paddingSymmetric(vertical: 20, horizontal: 10),
      ),
    );
  }
}
