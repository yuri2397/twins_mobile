import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:appinio_swiper/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twins/core/model/user.dart';
import 'package:twins/core/services/chat_request.service.dart';
import 'package:twins/core/services/matching.service.dart';
import 'package:twins/core/utils/utils.dart';
import 'package:twins/routes/router.dart';

class SearchController extends GetxController {
  final _matchingService = Get.find<MatchingService>();
  final AppinioSwiperController swiperController = AppinioSwiperController();
  final currentMatch = <User>[].obs;
  final visibleUser = User(id: 0).obs;
  final _chatRequestService = Get.find<ChatRequestService>();
  final canUnswip = false.obs;
  final detailUserPhotosController = PageController();
  final matchLoad = false.obs;
  final detailsLoad = false.obs;
  @override
  void onInit() {
    determinePosition().then((value) {
      var user = localStorage.getUser();
      user?.lat = "${value.latitude}";
      user?.lng = "${value.longitude}";
      localStorage.user = user;
    });
    getMatchings();
    super.onInit();
  }

  void getMatchings() {
    matchLoad.value = true;
    _matchingService.matchings().then((value) {
      print(value.toList().toString());
      currentMatch.value = value;
      visibleUser.value = value.first;
      visibleUser.refresh();
      currentMatch.refresh();
      matchLoad.value = false;
    }).catchError((e) {
      print(e);
      matchLoad.value = false;
    });
  }

  void swipe(int index, AppinioSwiperDirection direction) {
    visibleUser.value = currentMatch[index];
    canUnswip.value = true;
    Get.log("$index, ${visibleUser.value}");
    if (currentMatch.length >= 10 && (currentMatch.length / 2 < index)) {
      _matchingService.matchings().then((value) {
        currentMatch.addAll(value);
      }).catchError((e) {
        Get.log("EEEEEEEEEEEEEER : $e");
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
    visibleUser.refresh();

    if (canUnswip.value) {
      swiperController.unswipe();
      canUnswip.value = false;
      canUnswip.refresh();
    }
  }

  onCancel(User currentMatch) {
    visibleUser.value = currentMatch;
    visibleUser.refresh();
    swiperController.swipeLeft();
  }

  searchDetails(User user) async {
    detailsLoad.value = true;
    _matchingService.matchingDetails(user: user).then((value) {
      visibleUser.value = value;
      visibleUser.refresh();
      print(visibleUser.value.toJson().toString());
      detailsLoad.value = false;
    }).catchError((e) {
      detailsLoad.value = false;
      print("ERERERER: $e");
    });
    Get.toNamed(Goo.searchDetailsScreen);
  }
}
