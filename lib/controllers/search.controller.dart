import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:appinio_swiper/controllers.dart';
import 'package:get/get.dart';
import 'package:twins/core/model/user.dart';
import 'package:twins/core/services/chat_request.service.dart';
import 'package:twins/core/services/matching.service.dart';

class SearchController extends GetxController {
  final _matchingService = Get.find<MatchingService>();
  final AppinioSwiperController swiperController = AppinioSwiperController();
  final currentMatch = <User>[].obs;
  final visibleUser = User(id:0).obs;
  final _chatRequestService = Get.find<ChatRequestService>();

  @override
  void onInit() {
    getMatchings();
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
    _chatRequestService.sendRequestChat(toUser: currentMatch).then((value)  {
      print("LIKE SUCCESS");
    }).catchError((e){
      print("$e");
    });
  }

  onSwipBack(User currentMatch) {
    visibleUser.value = currentMatch;
    swiperController.unswipe();
  }

  onCancel(User currentMatch) {
    visibleUser.value = currentMatch;

    swiperController.swipeLeft();
  }
}
