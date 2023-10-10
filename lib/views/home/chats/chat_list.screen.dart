import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:twinz/controllers/chat.controller.dart';
import 'package:twinz/core/model/chat.dart';
import 'package:twinz/core/utils/utils.dart';
import 'package:twinz/routes/router.dart';
import 'package:twinz/shared/utils/colors.dart';

class ChatListScreen extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: MAIN_COLOR,
            leading: const Icon(Icons.menu, color: Colors.white),
          ),
          body: controller.chatsLoad.value
              ? const Center(
                  child: CircularProgressIndicator(color: MAIN_COLOR),
                )
              : controller.chats.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SvgPicture.asset(
                            "assets/images/message.svg",
                            width: 300,
                          ),
                          const Text(
                            "Aucune données",
                            style: TextStyle(
                                color: DARK_COLOR,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ).marginSymmetric(horizontal: 20)
                        ],
                      ),
                    )
                  : RefreshIndicator(
                      color: MAIN_COLOR,
                      onRefresh: () =>
                          Future.sync(() async => await controller.getChats()),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Messages",
                            style: TextStyle(
                                color: MAIN_COLOR,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ).marginAll(20),
                          Expanded(
                            child: ListView.separated(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                shrinkWrap: true,
                                separatorBuilder: (_, index) => const Divider(
                                      height: 10,
                                      color: MAIN_COLOR,
                                    ),
                                itemBuilder: (_, index) =>
                                    _buildChatItem(controller.chats[index]),
                                itemCount: controller.chats.length),
                          ),
                        ],
                      ),
                    )),
    );
  }

  _buildChatItem(Chat chat) {
    var sender = chat.participants
        ?.firstWhere((element) => element.id.toString() != currentUserId);
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () => controller.detailsChat(chat),
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: sender!.profilePhoto != null && sender.profilePhoto!.isNotEmpty
              ? Image.network(
                  sender.profilePhoto!,
                  height: 90,
                )
              : Image.asset("assets/images/img.png")),
      title: Text(chat.participants!
          .firstWhere((e) => e.id.toString() != currentUserId)
          .fullName!),
      subtitle: Text(chat.messages!.isEmpty
          ? "Envoyer le premier message..."
          : "${chat.messages!.last.message}"),
      trailing: Text(DateFormat.Hm().format(chat.createdAt!)),
    ).marginSymmetric(horizontal: 10, vertical: 5);
  }
}
