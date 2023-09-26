import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:twins/components/ui.dart';
import 'package:twins/controllers/chat_request.controller.dart';
import 'package:twins/core/model/chat_request.dart';
import 'package:twins/shared/utils/colors.dart';

class ChatRequestScreen extends GetView<ChatRequestController> {
  const ChatRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBar(
          title: const Text("Demandes de discussions"),
          elevation: 0,
        ),
        body: controller.loading.value && controller.items.isEmpty
            ? const Center(
                child: CircularProgressIndicator(color: MAIN_COLOR),
              )
            : RefreshIndicator(
          onRefresh: () => Future.sync(() async => controller.sentChatRequest()),
              color: MAIN_COLOR,
              child:
              controller.items.isEmpty ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SvgPicture.asset("assets/images/notifications.svg", width: 300,),
                    const Text("Aucune notification", style: TextStyle(color: DARK_COLOR, fontSize: 18, fontWeight: FontWeight.w500) , textAlign: TextAlign.center,).marginSymmetric(horizontal: 20)
                  ],
                ),
              ) :
              GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 290,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: controller.items.length,
                  itemBuilder: (BuildContext context, int index) =>
                      _buildItem(controller.items[index])).marginAll(20),
            )));
  }

  Widget _buildItem(ChatRequest request) {
    return Container(
      height: 300,
        width: Get.width,
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
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(20)),
                    child: SizedBox(
                      height: 190,
                      width: Get.width,
                      child: Image.network(
                          "https://img.freepik.com/free-photo/portrait-young-businesswoman-holding-eyeglasses-hand-against-gray-backdrop_23-2148029483.jpg?w=740&t=st=1695565814~exp=1695566414~hmac=586f96c0ddffa502148f29cc2c29f896fbdea68863e1b18ff06b44a2f8923713",
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("${request.userInvited?.fullName} ", textAlign: TextAlign.center, maxLines: 2,).marginAll(5),
                  Text("Âge ${request.userInvited?.age} ans", style: TextStyle(color: Colors.black.withOpacity(0.5)))
                ],
            ),
            Positioned(
              bottom: 90,
              right: 10,
              child: GestureDetector(
                onTap: (){},
                child:
                itemIcon(CupertinoIcons.heart_circle_fill)
              ),
            )
          ],
        ));
  }
}
