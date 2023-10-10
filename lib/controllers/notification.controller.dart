import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twinz/core/services/notification.service.dart';
import 'package:twinz/core/model/notification.dart' as nt;

class NotificationController extends GetxController {
  final items = <nt.Notification>[].obs;
  final loading = false.obs;
  final _service = Get.find<NotificationService>();

  @override
  void onInit() {
    super.onInit();
    fetchNotifications();
  }

  Future<void> fetchNotifications() async {
    loading.value = true;
    await _service.index().then((value) {
      items.value = value;
      items.refresh();
      loading.value = false;
      print("${value.toString()}");
    }).catchError((e) {
      print("$e");
      loading.value = false;
    });
  }

  Future<void> markAsRead(String id) async {
    _service.markAsRead(id: id).then((value) {
      print("Not read");
      items.removeWhere((element) => element.id == id);
      items.refresh();
    });
  }
}
