import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:twins/controllers/chat.controller.dart';
import 'package:twins/controllers/home.controller.dart';
import 'package:twins/core/utils/utils.dart';

class ChatScreen extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Chat(
          messages: controller.messages,
          onMessageTap: (context, message) =>
              controller.handleMessageTap(context, message),
          onPreviewDataFetched: (textMessage, preview) =>
              controller.handlePreviewDataFetched(textMessage, preview),
          onSendPressed: (partialText) =>
              controller.handleSendPressed(partialText),
          showUserAvatars: true,
          showUserNames: true,
          emptyState: _emptyState(),
          user: controller.user,
        ),
      );

  _emptyState() {
    return Center(
        child: Container(
      width: Get.width,
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.all(Get.width * .15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 100,
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            "assets/images/empty_chat.svg",
            width: 80,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Commencez une nouvelle conversation !",
            textAlign: TextAlign.center,
          )
        ],
      ),
    ));
  }
}
