import 'package:get/get.dart';
import 'package:twins/core/model/chat_request.dart';
import 'package:twins/core/services/chat_request.service.dart';

class ChatRequestController extends GetxController {
  final items = <ChatRequest>[].obs;
  final loading = false.obs;
  final _service = Get.find<ChatRequestService>();

  @override
  void onInit() async {
    super.onInit();
    sentChatRequest();
  }

  Future<void> sentChatRequest() async {
    loading.value = true;
    await _service.sentRequestChats().then((value) {
      items.value = value;
      items.refresh();
      loading.value = false;
    }).catchError((e, s) {
      e.printError();
      s.printError();
      loading.value = false;
    });
  }
}
