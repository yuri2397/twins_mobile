import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:get/get.dart';
import 'package:twins/core/model/chat.dart' as lc;
import 'package:twins/core/services/chat.service.dart';
import 'package:twins/core/utils/utils.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:twins/routes/router.dart';

class ChatController extends GetxController {
  final messages = <types.Message>[].obs;
  final types.User user = types.User(
    id: currentUserId,
  );
  final chats = <lc.Chat>[].obs;
  final chatsLoad = false.obs;

  final _service = Get.find<ChatService>();

  final currentChat = lc.Chat().obs;

  final textFielController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getChats();
  }

  Future<void> getChats() async {
    chatsLoad.value = true;
    _service.chats().then((value) {
      chats.value = value;
      chats.refresh();
      chatsLoad.value = false;
    }).catchError((e) {
      print("$e");
    });
  }

  detailsChat(lc.Chat chat) {
    chat.messages!.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
    currentChat.value = chat;

    messages.value = chat.messages!
        .map((e) => types.Message.fromJson(e.toJsonForMessage()))
        .toList();
    Get.toNamed(Goo.chatScreen);
  }

  void addMessage() {
    var message = lc.Message(
        chatId: "${currentChat.value.id}",
        message: textFielController.text.trim(),
        userId: currentUserId,
        sender: localStorage.getUser(),
        createdAt: DateTime.now(),
        id: currentChat.value.messages!.last.id! + 1);

    messages.insert(0, types.Message.fromJson(message.toJsonForMessage()));
    messages.refresh();
  }

  void handleSendPressed(types.PartialText message) {
    // final textMessage = types.TextMessage(
    //   author: _user,
    //   createdAt: DateTime.now().millisecondsSinceEpoch,
    //   id: const Uuid().v4(),
    //   text: message.text,
    // );

    // _addMessage(textMessage);
  }

  void handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    // final index = _messages.indexWhere((element) => element.id == message.id);
    // final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
    //   previewData: previewData,
    // );

    // setState(() {
    //   _messages[index] = updatedMessage;
    // });
  }

  void handleMessageTap(_, types.Message message) async {
    // if (message is types.FileMessage) {
    //   var localPath = message.uri;

    //   if (message.uri.startsWith('http')) {
    //     try {
    //       final index =
    //           _messages.indexWhere((element) => element.id == message.id);
    //       final updatedMessage =
    //           (_messages[index] as types.FileMessage).copyWith(
    //         isLoading: true,
    //       );

    //       setState(() {
    //         _messages[index] = updatedMessage;
    //       });

    //       final client = http.Client();
    //       final request = await client.get(Uri.parse(message.uri));
    //       final bytes = request.bodyBytes;
    //       final documentsDir = (await getApplicationDocumentsDirectory()).path;
    //       localPath = '$documentsDir/${message.name}';

    //       if (!File(localPath).existsSync()) {
    //         final file = File(localPath);
    //         await file.writeAsBytes(bytes);
    //       }
    //     } finally {
    //       final index =
    //           _messages.indexWhere((element) => element.id == message.id);
    //       final updatedMessage =
    //           (_messages[index] as types.FileMessage).copyWith(
    //         isLoading: null,
    //       );

    //       setState(() {
    //         _messages[index] = updatedMessage;
    //       });
    //     }
    //   }

    //   await OpenFilex.open(localPath);
  }

  moreInfo(int index) {}
}
