import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:twins/controllers/profile.controller.dart';
import 'package:twins/shared/utils/colors.dart';

class PasswordProfileScreen extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          TextFormField(
                  style: TextStyle(color: MAIN_COLOR),
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value == null) {
                      return "Champ obligatoire.";
                    }
                    if (value.isEmpty || value.length < 4) {
                      return "Mot de passe invalide";
                    }

                    return null;
                  },
                  decoration: _inputDecoration(text: "Nom complet", req: true))
              .marginOnly(bottom: 20),
        ],
      ),
    ));
  }

  _inputDecoration({bool? req, required String text}) {
    return InputDecoration(
        label: Text.rich(
          TextSpan(text: text, style: TextStyle(), children: [
            TextSpan(text: " *", style: TextStyle(color: Colors.red))
          ]),
        ),
        floatingLabelStyle: TextStyle(color: DARK_COLOR),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: MAIN_COLOR)));
  }
}
