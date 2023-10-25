import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:appinio_swiper/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twinz/components/ui.dart';
import 'package:twinz/core/model/user.dart';
import 'package:twinz/core/services/chat_request.service.dart';
import 'package:twinz/core/services/matching.service.dart';
import 'package:twinz/core/services/user.service.dart';
import 'package:twinz/core/utils/utils.dart';
import 'package:twinz/routes/router.dart';
import 'package:twinz/shared/utils/colors.dart';

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
  final subscribeForPremium = false.obs;
  final matchSuccess = true.obs;
  final likeLoad = false.obs;
  final _swipIndex = localStorage.getSwipIndex().obs;
  final _userService = Get.find<UserService>();

  final showCancelIcon = false.obs;
  final showLikeIcons = false.obs;

  @override
  void onInit() {
    _swipIndex.listen((newIndex) {
      localStorage.swipIndex = newIndex;
    });
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
      currentMatch.value = value;
      if (value.isEmpty) {
        matchSuccess.value = false;
      } else {
        visibleUser.value = value.first;
        matchSuccess.value = true;
        visibleUser.refresh();
        currentMatch.refresh();
      }
      matchLoad.value = false;
    }).catchError((e, s) {
      matchLoad.value = false;
    });
  }

  void swipe(int index, AppinioSwiperDirection direction) {
    print("INDEX $index");
    _swipIndex.value = index;
    if (direction == AppinioSwiperDirection.left) {
      subscribeForPremium.value = currentMatch.length == index + 1 &&
          (localStorage.getUser()!.isPremium == false);

      if ((localStorage.getUser()!.isPremium == true)) {
        if (((currentMatch.length ~/ 2) + 1 <= index)) {
          matchLoad.value = true;
          _matchingService.matchings().then((value) {
            currentMatch.addAll(value);
            currentMatch.refresh();
            matchLoad.value = false;
          }).catchError((e) {
            matchLoad.value = false;
          });
        }
      }
      canUnswip.value = true;

      _matchingService.matchingSkip(currentMatch[index]);
    } else if (direction == AppinioSwiperDirection.right) {
      onLike(currentMatch[index]);
    }

    visibleUser.value = currentMatch[index - 1];
    visibleUser.refresh();
    showCancelIcon.value = false;
    showLikeIcons.value = false;
  }

  onLike(User currentMatch) {
    likeLoad.value = true;
    _chatRequestService.sendRequestChat(toUser: currentMatch).then((value) {
      likeLoad.value = false;
    }).catchError((e) {
      likeLoad.value = false;
    });
    swiperController.swipeRight();
  }

  onSwipBack(User currentMatch) {
    visibleUser.value = currentMatch;
    visibleUser.refresh();

    if (canUnswip.value) {
      if (localStorage.getUser()!.isPremium == false) {
        canUnswip.value = false;
      }
      canUnswip.refresh();
      swiperController.unswipe();
    }
    _matchingService.matchingCancelSkip(currentMatch);
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
      detailsLoad.value = false;
    }).catchError((e) {
      detailsLoad.value = false;
      print("ERERERER: $e");
    });
    Get.toNamed(Goo.searchDetailsScreen);
  }

  activeAccount() {
    matchLoad.value = true;
    _userService.enableAccount().then((value) {
      getMatchings();
      matchLoad.value = false;
    }).catchError((e) {
      print("$e");
      matchLoad.value = false;
    });
  }

  void onSwipLeft() {
    showCancelIcon.value = true;
  }

  void onSwipRight() {
    showLikeIcons.value = true;
  }
}
