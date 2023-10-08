import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:twins/controllers/offer.controller.dart';
import 'package:twins/shared/utils/colors.dart';

class OfferScreen extends GetView<OfferController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MAIN_COLOR,
        elevation: 0,
        leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios, color: Colors.white)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Abonnement",
            style: TextStyle(
                color: MAIN_COLOR,
                fontSize: 30,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Get.width * .3,
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                margin:
                const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: GRAY_COLOR, width: 2),
                ),
                child: const Column(
                  children: [
                    Text("7 jours ",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20)),
                    Text("Avec tous les avantages Twinz+", textAlign: TextAlign.center,),
                    Text(
                      "2 000 F",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    )
                  ],
                ),
              ),
              Container(
                width: Get.width * .3,
                margin:
                const EdgeInsets.symmetric(horizontal: 2),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: MAIN_COLOR, width: 2),
                ),
                child: const Column(
                  children: [
                    Text("17 jours ",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20)),
                    Text("Avec tous les avantages Twinz premium",textAlign: TextAlign.center),
                    Text(
                      "5 000 F",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    )
                  ],
                ),
              ),
              Container(
                width: Get.width * .3,
                margin:
                const EdgeInsets.symmetric(horizontal: 2),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: GRAY_COLOR, width: 2),
                ),
                child: const Column(
                  children: [
                    Text("30 jours ",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20)),
                    Text("Pour mieux préparer votre anniversaire", textAlign: TextAlign.center),
                    Text(
                      "10 000 F",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    )
                  ],
                ),
              )
            ],
          )

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
    );
  }
}
