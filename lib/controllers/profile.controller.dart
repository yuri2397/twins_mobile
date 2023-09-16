import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twins/core/utils/utils.dart';

class ProfileController extends GetxController {
  final _userService = Get.find();
  final user = localStorage.getUser();

  final nameCrtl = TextEditingController();
  final emailCrtl = TextEditingController();
  final phoneCrtl = TextEditingController();
  final addressCrtl = TextEditingController();
  final birthdayCrtl = TextEditingController();
  final sexCrtl = TextEditingController();
  final passwordCrtl = TextEditingController();

  void save() {}
}
