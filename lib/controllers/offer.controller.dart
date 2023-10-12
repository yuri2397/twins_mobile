import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:twinz/components/ui.dart';
import 'package:twinz/core/model/init_payment.dart';
import 'package:twinz/core/model/plan.dart';
import 'package:twinz/core/services/payment.service.dart';
import 'package:twinz/core/services/profile.service.dart';
import 'package:twinz/routes/router.dart';
import 'package:twinz/shared/utils/colors.dart';
import 'package:twinz/views/home/profile/profile.screen.dart';

class OfferController extends GetxController {
  final load = false.obs;
  final _service = Get.find<PaymentService>();
  final offers = <Plan>[].obs;
  final offerLoad = true.obs;
  final lastInitPayment = InitPayment().obs;
  @override
  Future<void> onInit() async {
    super.onInit();

    getOffers();
  }

  Future<void> getOffers() async {
    offerLoad.value = true;
    _service.index().then((value) {
      print("${value[0].toJson().toString()}");
      offers.value = value;
      offers.refresh();
      offerLoad.value = false;
    }).catchError((e) {
      offerLoad.value = false;
    });
  }

  Future<void> choosePlan(Plan p) async {
    load.value = true;
    _service.initPayment(p.id.toString()).then((value) async {
      lastInitPayment.value = value;
      print("${value.clientSecret}");

      var stripeval = await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: value.clientSecret,
                  style: ThemeMode.dark,
                  merchantDisplayName: 'Twins'))
          .then((value) {});
      load.value = false;
      print("${stripeval.toString()}");
      await _displayPaymentSheet();
      _checkPayment(value);
    }).catchError((e) {
      print("${e.message}");
      load.value = false;
    });
  }

  Future<void> _displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        //Clear paymentIntent variable after successful payment
      }).onError((error, stackTrace) {
        print(error);
        stackTrace.printError();
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
    } catch (e) {
      print('$e');
    }
  }

  void _checkPayment(InitPayment value) async {
    _service.paymentSuccess("${value.id}").then((value) async {
      print("$value");
      if (value) {
        /***
         * REDICT USER AND UPDATE LOCAL DATA
         */

        await Get.bottomSheet(Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              hr(),
              const SizedBox(
                height: 10,
              ),
              const Icon(
                Icons.check,
                color: Colors.green,
                size: 50,
              ),
              const Text("Félicitation",
                  style: TextStyle(color: DARK_COLOR, fontSize: 20)),
              const Text("Votre paiement est validé.")
            ],
          ),
        ));

        Get.find<ProfileService>()
            .profile()
            .then((value) => Get.toNamed(Goo.homeScreen));
      }
    }).catchError((e) {
      print("$e");
    });
  }
}
