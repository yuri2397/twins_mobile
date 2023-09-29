import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:twins/controllers/chat.controller.dart';
import 'package:twins/core/model/chat.dart';
import 'package:twins/core/utils/utils.dart';
import 'package:twins/routes/router.dart';
import 'package:twins/shared/utils/colors.dart';

class ChatListScreen extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Obx(()=> Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: MAIN_COLOR,
            leading: Icon(Icons.menu, color: Colors.white),
          ),
          body:controller.chatsLoad.value ? const Center( child: CircularProgressIndicator(color: MAIN_COLOR),) :
          controller.chats.isEmpty ?
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SvgPicture.asset(
                  "assets/images/notifications.svg",
                  width: 300,
                ),
                const Text(
                  "Aucune notification",
                  style: TextStyle(
                      color: DARK_COLOR,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ).marginSymmetric(horizontal: 20)
              ],
            ),
          )
              :
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const Text("Messages", style: TextStyle(color: DARK_COLOR, fontSize: 20, fontWeight: FontWeight.bold), ).marginAll(10),
              ListView.separated(
                shrinkWrap: true,
                  separatorBuilder: (_, index) => Divider(height: 2, color: NEUTRAL_COLOR,),
                  itemBuilder: (_, index) => _buildChatItem(controller.chats[index]), itemCount: controller.chats.length),
            ],
          )),
    );
  }

  _buildChatItem(Chat chat) {
    return  ListTile(
        onTap: () => controller.detailsChat(chat),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            "https://img.freepik.com/free-photo/portrait-young-businesswoman-holding-eyeglasses-hand-against-gray-backdrop_23-2148029483.jpg?w=740&t=st=1694816532~exp=1694817132~hmac=09953c455aef36f7436fcf1aafa10fe5b3d4d69cd0f8ec2b82963603a6f5dddd",
            height: 90,
          ),
        ),
        title: Text(chat.participants!.firstWhere((e) => e.id.toString() != currentUserId).fullName!),
        subtitle: Text(chat.messages!.isEmpty ? "Envoyer le premier message..." : "${chat.messages!.last.message}"),
        trailing: Text(DateFormat.Hm().format(chat.createdAt!)),
      ).marginSymmetric(horizontal: 10, vertical: 5);
  }
}
