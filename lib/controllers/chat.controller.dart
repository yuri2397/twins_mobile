import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twinz/core/model/chat.dart' as lc;
import 'package:twinz/core/services/chat.service.dart';
import 'package:twinz/core/services/user.service.dart';
import 'package:twinz/core/utils/utils.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:twinz/routes/router.dart';
import 'package:chatview/chatview.dart' as hc;
import 'package:twinz/shared/utils/colors.dart';

import '../core/model/user.dart';

class ChatController extends GetxController {
  final messages = <hc.Message>[].obs;
  final _localUser = localStorage.getUser();
  get localUser => _localUser;
  final RxList<lc.Chat> chats = localStorage.getMessages().obs;
  final chatsLoad = false.obs;

  final _service = Get.find<ChatService>();

  final currentChat = lc.Chat().obs;
  final showDetailsLoad = false.obs;
  final textFieldController = TextEditingController();
  hc.ChatController chatController = hc.ChatController(
    initialMessageList: [],
    scrollController: ScrollController(),
    chatUsers: [],
  );

  @override
  void onInit() {
    super.onInit();

    localStorage.box.listenKey("_message", (value) {
      print("MESSAGE CHANGED");
    });
    getChats();
  }

  Future<void> getChats() async {
    chatsLoad.value = true;
    await _service.chats().then((value) {
      chats.value = value;

      chats.refresh();
      localStorage.messages = chats;
      chatsLoad.value = false;
    }).catchError((e) {
      print("$e");
    });
  }

  detailsChat(lc.Chat chat) {
    currentChat.value = chat;
    Get.toNamed(Goo.chatScreen);
    showDetailsLoad.value = true;
    _service.chatDetails(chat: chat).then((value) {
      User sender = value.participants!
          .firstWhere((element) => element.id != int.tryParse(currentUserId));
      messages.value = value.messages!
          .map((e) => hc.Message(
              id: "${e.id}",
              message: "${e.message}",
              createdAt: value.createdAt!,
              status: "${e.data?.status}" == 'send'
                  ? hc.MessageStatus.delivered
                  : hc.MessageStatus.read,
              sendBy: "${e.sender?.id}"))
          .toList();

      chatController = hc.ChatController(
        initialMessageList: messages,
        scrollController: ScrollController(),
        chatUsers: [
          hc.ChatUser(
              id: "${sender.id}",
              name: "${sender.fullName}",
              profilePhoto: "${sender.profilePhoto}"),
        ],
      );
      showDetailsLoad.value = false;
    }).catchError((e) {
      showDetailsLoad.value = false;
    });
  }

  Future<void> onSendTap(
    String message,
    hc.ReplyMessage replyMessage,
    hc.MessageType messageType,
  ) async {
    final id = int.parse(messages.last.id) + 1;
    chatController.addMessage(
      hc.Message(
        id: id.toString(),
        createdAt: DateTime.now(),
        message: message,
        sendBy: currentUserId,
        status: hc.MessageStatus.pending,
        replyMessage: replyMessage,
        messageType: messageType,
      ),
    );
    _service
        .sendMessage(chat: currentChat.value, message: message)
        .then((value) {
      chatController.initialMessageList.last.setStatus =
          hc.MessageStatus.undelivered;
    }).catchError((e) {
      print("$e");
    });
  }

  Future<void> blockUser(User user) async {
    Get.find<UserService>().blockUser(user: user).then((value) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Text("Vous avez bloqué ${user.fullName}"),
        backgroundColor: MAIN_COLOR,
      ));
    }).catchError((e) {});
  }

  Future<void> reportUser(User user) async {
    Get.find<UserService>().reportUser(user: user).then((value) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Text("Vous avez signalé ${user.fullName}"),
        backgroundColor: MAIN_COLOR,
      ));
    }).catchError((e) {});
  }

  markMessageIsRead(messageId) {
    _service.markAsRead(messageId).then((value) {});
  }

  moreInfo(int index) {}
}
