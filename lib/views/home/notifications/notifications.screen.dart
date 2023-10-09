import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:twins/components/ui.dart';
import 'package:twins/controllers/notification.controller.dart';
import 'package:twins/shared/utils/colors.dart';
import 'package:twins/core/model/notification.dart' as nt;

class NotificationsScreen extends GetView<NotificationController> {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: MAIN_COLOR,
            title: const Text("Notifications",
                style: TextStyle(color: Colors.white)),
          ),
          body: controller.loading.value && controller.items.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(color: MAIN_COLOR),
                )
              : RefreshIndicator(
                  onRefresh: () => Future.sync(
                      () async => await controller.fetchNotifications()),
                  color: MAIN_COLOR,
                  child: controller.items.isEmpty
                      ? Center(
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
                      : ListView.builder(
                          itemCount: controller.items.length,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          itemBuilder: (BuildContext context, int index) =>
                              Dismissible(
                                key: Key(controller.items[index].id!),
                                onDismissed: (_) => controller
                                    .markAsRead(controller.items[index].id!),
                                child: _buildItem(controller.items[index])
                                    .marginOnly(bottom: 16),
                              )).marginSymmetric(horizontal: 20),
                )),
    );
  }

  Widget _buildItem(nt.Notification item) {
    switch (item.data?.data?.type) {
      case 'message':
        return _buildMessage(item);
      case 'request_accepted':
        return _buildAcceptRequest(item);
      case 'new_request':
        return _buildNewRequest(item);
      default:
        return Container();
    }
  }

  _buildMessage(nt.Notification item) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: NEUTRAL_COLOR,
            spreadRadius: 10,
            blurRadius: 30,
            offset: Offset(10, 20), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: ListTile(
        title: Text("${item.data?.title}"),
        subtitle: Text("${item.data?.body}"),
        leading: const CircleAvatar(
          backgroundColor: MAIN_COLOR,
          child: Icon(Icons.message, color: Colors.white),
        ),
        trailing: Text(DateFormat.Hm().format(item.createdAt!)),
      ),
    );
  }

  _buildAcceptRequest(nt.Notification item) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: NEUTRAL_COLOR,
            spreadRadius: 10,
            blurRadius: 30,
            offset: Offset(10, 20), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: ListTile(
        title: Text("${item.data?.title}"),
        subtitle: Text("${item.data?.body}"),
        trailing: Text(DateFormat.Hm().format(item.createdAt!)),
      ),
    );
  }

  _buildNewRequest(nt.Notification item) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: NEUTRAL_COLOR,
            spreadRadius: 10,
            blurRadius: 30,
            offset: Offset(10, 20), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: ListTile(
        title: Text("${item.data?.title}"),
        subtitle: Text("${item.data?.body}"),
        trailing: Text(DateFormat.Hm().format(item.createdAt!)),
      ),
    );
  }
}
