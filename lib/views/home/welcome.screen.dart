import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:twins/controllers/home.controller.dart';

class WelcomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("HOME PAGE"),
      ),
    );
  }
}
