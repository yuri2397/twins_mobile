import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twins/controllers/chat.controller.dart';
import 'package:twins/core/utils/utils.dart';
import 'package:twins/shared/utils/colors.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: MAIN_COLOR,
          elevation: 0,
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
          actions: [
            PopupMenuButton<int>(
              color: Colors.white,
              onSelected: (item) => controller.moreInfo(item),
              itemBuilder: (context) => [
                PopupMenuItem<int>(value: 0, child: Text('Voir le profil')),
                PopupMenuItem<int>(value: 1, child: Text('Bloquer')),
                PopupMenuItem<int>(value: 2, child: Text('Signaler')),
              ],
            )
          ],
          title: Text(
            "${controller.currentChat.value.participants?.firstWhere((e) => e.id.toString() != currentUserId).fullName}",
            style: TextStyle(color: Colors.white),
          ),
        ),
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
          customBottomWidget: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: .2,
                  blurRadius: 10,
                  offset: const Offset(2, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextFormField(
              controller: controller.textFielController,
              cursorColor: DARK_COLOR,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(fontSize: 16), color: DARK_COLOR),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                hintText: "Message",
                hintStyle:
                    const TextStyle(color: DARK_COLOR, fontFamily: "Poppins"),
                fillColor: Colors.white,
                filled: true,
                suffix: GestureDetector(
                  onTap: () => controller.addMessage(),
                  child: const CircleAvatar(
                    backgroundColor: MAIN_COLOR,
                    child: Icon(Icons.send, color: Colors.white),
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: MAIN_COLOR)),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: DARK_COLOR)),
              ),
            ),
          ),
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
