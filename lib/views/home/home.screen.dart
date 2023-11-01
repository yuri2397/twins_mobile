import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:twinz/controllers/home.controller.dart';
import 'package:twinz/controllers/notification.controller.dart';
import 'package:twinz/core/services/notification.service.dart';
import 'package:twinz/shared/utils/colors.dart';
import 'package:twinz/views/home/chats/chat_list.screen.dart';
import 'package:twinz/views/home/notifications/notifications.screen.dart';
import 'package:twinz/views/home/profile/profile.screen.dart';
import 'package:twinz/views/home/search/search.screen.dart';

class HomeScreen extends GetView<HomeController> {
  final _screens = <Widget>[
    SearchScreen(),
    NotificationsScreen(),
    ChatListScreen(),
    const ProfileScreen()
  ];

  HomeScreen({super.key});

  final notificationController = Get.find<NotificationController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: _screens[controller.currentIndex.value],
        bottomNavigationBar: SafeArea(
          child: Container(
            color: MAIN_COLOR,
            height: 65,
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: NavigationBar(
              onDestinationSelected: (int index) {},
              selectedIndex: controller.currentIndex.value,
              backgroundColor: Colors.white,
              destinations: <Widget>[
                GestureDetector(
                  onTap: () {
                    controller.currentIndex.value = 0;
                    controller.currentIndex.refresh();
                  },
                  child: ImageIcon(
                    const AssetImage('assets/images/home.png'),
                    color: controller.currentIndex.value == 0
                        ? MAIN_COLOR
                        : Colors.grey[400],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.currentIndex.value = 1;
                    notificationController.haveUnreadNotification.value = false;
                    controller.currentIndex.refresh();
                  },
                  child: !notificationController.haveUnreadNotification.value
                      ? Icon(Icons.notifications,
                          color: controller.currentIndex.value == 1
                              ? MAIN_COLOR
                              : Colors.grey[400])
                      : SvgPicture.asset('assets/icons/unread.svg',
                          width: 22,
                          color: controller.currentIndex.value == 1
                              ? MAIN_COLOR
                              : Colors.grey[400]),
                ),
                GestureDetector(
                    onTap: () {
                      controller.currentIndex.value = 2;
                      controller.currentIndex.refresh();
                    },
                    child: Icon(CupertinoIcons.chat_bubble_2_fill,
                        color: controller.currentIndex.value == 2
                            ? MAIN_COLOR
                            : Colors.grey[400])),
                GestureDetector(
                    onTap: () {
                      controller.currentIndex.value = 3;
                      controller.currentIndex.refresh();
                    },
                    child: Icon(CupertinoIcons.person_fill,
                        color: controller.currentIndex.value == 3
                            ? MAIN_COLOR
                            : Colors.grey[400])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
PersistentTabView(
      context,
      controller: _controller,
      screens: _screens,
      items: _items,
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: const NavBarDecoration(
        boxShadow: [
          BoxShadow(
            color: NEUTRAL_COLOR,
            spreadRadius: 1,
            blurRadius: 20,
            offset: Offset(2, 3), // changes position of shadow
          ),
        ],
        colorBehindNavBar: MAIN_COLOR,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.
    )

*/
