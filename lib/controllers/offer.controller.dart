import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:twinz/core/model/init_payment.dart';
import 'package:twinz/core/model/plan.dart';
import 'package:twinz/core/services/payment.service.dart';

class OfferController extends GetxController{
  final _service = Get.find<PaymentService>();
    final offers = <Plan>[].obs;
    final offerLoad = true.obs;
    final lastInitPayment = InitPayment().obs;
  @override
  Future<void> onInit() async {
    super.onInit();

    getOffers();
  }

  Future<void> getOffers() async{
    offerLoad.value = true;
    _service.index().then((value){
      print("EEEEEEEEEEEEEEEEEE");
      print("${value}");
      print("EEEEEEEEEEEEEEEEEE");
      offers.value = value;
      offers.refresh();
      offerLoad.value = false;
    }).catchError((e){
      offerLoad.value = false;

    });

  }

  Future<void> choosePlan(Plan p) async{
    _service.initPayment(p.id.toString()).then((value) async {
      lastInitPayment.value = value;
      print("${value.clientSecret}");

      await Stripe.instance
          .initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            customFlow: true,
              paymentIntentClientSecret: value.clientSecret, //Gotten from payment intent
              style: ThemeMode.light,
              merchantDisplayName: 'Twins'))
          .then((value) {});

      _displayPaymentSheet();

    }).catchError((e){
      print("${e.message}");
    });


  }

  void _displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {

        //Clear paymentIntent variable after successful payment

      })
          .onError((error, stackTrace) {
        throw Exception(error);
      });
    }
    on StripeException catch (e) {
      print('Error is:---> $e');
    }
    catch (e) {
      print('$e');
    }
  }
}