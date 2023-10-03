import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:appinio_swiper/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twins/core/model/user.dart';
import 'package:twins/core/services/chat_request.service.dart';
import 'package:twins/core/services/matching.service.dart';
import 'package:twins/core/utils/utils.dart';

class SearchController extends GetxController {
  final _matchingService = Get.find<MatchingService>();
  final AppinioSwiperController swiperController = AppinioSwiperController();
  final currentMatch = <User>[].obs;
  final visibleUser = User(id: 0).obs;
  final _chatRequestService = Get.find<ChatRequestService>();
  final canUnswip = false.obs;
  final detailUserPhotosController = PageController();

  @override
  void onInit() {
    getMatchings();
    determinePosition().then((value) {
      var user = localStorage.getUser();
      user?.lat = "${value.latitude}";
      user?.lng = "${value.longitude}";
      localStorage.user = user;
    });
    super.onInit();
  }

  void getMatchings() {
    _matchingService.matchings().then((value) {
      currentMatch.value = value;
      visibleUser.value = value.first;
      visibleUser.refresh();
      currentMatch.refresh();
    }).catchError((e) {
      print(e);
    });
  }

  void swipe(int index, AppinioSwiperDirection direction) {
    visibleUser.value = currentMatch[index];
    visibleUser.refresh();
    canUnswip.value = true;
    canUnswip.refresh();
    if (currentMatch.length - 3 == index) {
      _matchingService.matchings().then((value) {
        currentMatch.addAll(value);
        currentMatch.refresh();
      }).catchError((e) {
        print(e);
      });
    }
  }

  onLike(User currentMatch) {
    _chatRequestService.sendRequestChat(toUser: currentMatch).then((value) {
      print("LIKE SUCCESS");
    }).catchError((e) {
      print("$e");
    });
  }

  onSwipBack(User currentMatch) {
    visibleUser.value = currentMatch;
    if (canUnswip.value) {
      swiperController.unswipe();
      canUnswip.value = false;
      canUnswip.refresh();
    }
  }

  onCancel(User currentMatch) {
    visibleUser.value = currentMatch;
    swiperController.swipeLeft();
  }
}
