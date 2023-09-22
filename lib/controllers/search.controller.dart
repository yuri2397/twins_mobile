import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:appinio_swiper/controllers.dart';
import 'package:get/get.dart';
import 'package:twins/core/model/user.dart';
import 'package:twins/core/services/matching.service.dart';

class SearchController extends GetxController {
  final _matchingService = Get.find<MatchingService>();
  final AppinioSwiperController swiperController = AppinioSwiperController();
  final currentMatch = <User>[].obs;

  @override
  void onInit() {
    getMatchings();
    super.onInit();
  }

  void getMatchings() {
    _matchingService.matchings().then((value) {
      currentMatch.value = value;
      currentMatch.refresh();
    }).catchError((e) {
      print(e);
    });
  }

  void swipe(int index, AppinioSwiperDirection direction) {
    if (currentMatch.length - 3 == index) {
      _matchingService.matchings().then((value) {
        currentMatch.addAll(value);
        currentMatch.refresh();
      }).catchError((e) {
        print(e);
      });
    }
  }

  onLike(User currentMatch) {}

  onSwipBack(User currentMatch) {
    swiperController.unswipe();
  }

  onCancel(User currentMatch) {
    swiperController.swipeLeft();
  }
}
