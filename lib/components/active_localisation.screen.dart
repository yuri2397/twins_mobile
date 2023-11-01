import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twinz/controllers/active_location.controller.dart';
import 'package:twinz/shared/utils/colors.dart';

class ActiveLocationScreen extends GetView<ActiveLocationController>{
  const ActiveLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center( child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        const SizedBox(
        height: 20,
      ),
        const Text(
          "Autoriser l'accès à la Localisation.",
          style: TextStyle(
              color: MAIN_COLOR,
              fontSize: 30,
              fontFamily: "Haylard",
              fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Pour vous trouver des correspondances, nous avons besoin de connaître votre emplacement.",
          style: TextStyle(
              color: DARK_COLOR,
              fontSize: 16,
              fontFamily: "Haylard",
              fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30,),
        TextButton(
          onPressed: () => controller.activeLocation(),
          child: const Text("Activer la localisation",
              style: TextStyle(color: MAIN_COLOR)),
        ),

      ],).marginSymmetric(horizontal: 20)),
    );
  }

}