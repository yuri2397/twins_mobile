import 'package:get/get.dart';
import 'package:twins/components/ui.dart';
import 'package:twins/core/model/chat_request.dart';
import 'package:twins/core/services/chat_request.service.dart';

class ChatRequestController extends GetxController {
  final items = <ChatRequest>[].obs;
  final loading = false.obs;
  final _service = Get.find<ChatRequestService>();

  @override
  void onInit() async {
    super.onInit();
    receivedRequestChats();
  }

  Future<void> receivedRequestChats() async {
    loading.value = true;
    await _service.receivedRequestChats().then((value) {
      items.value = value;
      items.refresh();
      loading.value = false;
    }).catchError((e, s) {
      e.printError();
      s.printError();
      loading.value = false;
    });
  }

  Future<void> acceptChatRequest(ChatRequest request) async {
    await _service.acceptRequestChat(chatRequest: request).then((value) {
      items.removeWhere((element) => element.id == request.id);
      items.refresh();
    }).catchError((e) => errorMessage(title: "Oups !", content: "$e"));
  }

  Future<void> cancelChatRequest(ChatRequest request) async{
    await _service.cancelRequestChat(chatRequest: request).then((value) {
      items.removeWhere((element) => element.id == request.id);
      items.refresh();
    }).catchError((e) => errorMessage(title: "Oups !", content: "$e"));
  }
}
