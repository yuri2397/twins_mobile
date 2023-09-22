import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:twins/controllers/chat.controller.dart';
import 'package:twins/routes/router.dart';
import 'package:twins/shared/utils/colors.dart';

class ChatListScreen extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Chats"),
          actions: [
            GestureDetector(
              child: Icon(Icons.search),
            ).marginOnly(right: 10)
          ],
        ),
        body: ListView.builder(
            itemBuilder: (_, index) => _buildChatItem(index), itemCount: 10));
  }

  _buildChatItem(int index) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: .3,
            blurRadius: 4,
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: ListTile(
        onTap: () => Get.toNamed(Goo.chatScreen),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.network(
            "https://img.freepik.com/free-photo/portrait-young-businesswoman-holding-eyeglasses-hand-against-gray-backdrop_23-2148029483.jpg?w=740&t=st=1694816532~exp=1694817132~hmac=09953c455aef36f7436fcf1aafa10fe5b3d4d69cd0f8ec2b82963603a6f5dddd",
            height: 90,
          ),
        ),
        title: Text("Mor Diaw"),
        subtitle: Text("Bonjour, comment tu ..."),
        trailing: Text("10:09"),
      ),
    ).marginSymmetric(horizontal: 10, vertical: 5);
  }
}
