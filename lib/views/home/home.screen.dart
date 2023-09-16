import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:twins/controllers/home.controller.dart';
import 'package:twins/shared/utils/colors.dart';
import 'package:twins/views/home/chat.screen.dart';
import 'package:twins/views/home/profile/profile.screen.dart';
import 'package:twins/views/home/un.screen.dart';
import 'package:twins/views/home/search.screen.dart';

class HomeScreen extends GetView<HomeController> {
  final _screens = <Widget>[
    SearchScreen(),
    UnScreen(),
    ChatScreen(),
    ProfileScreen()
  ];

  final _items = <PersistentBottomNavBarItem>[
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.rocket_fill),
      activeColorPrimary: MAIN_COLOR,
      inactiveColorPrimary: NEUTRAL_COLOR,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.notifications),
      activeColorPrimary: MAIN_COLOR,
      inactiveColorPrimary: NEUTRAL_COLOR,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.chat_bubble_2),
      activeColorPrimary: MAIN_COLOR,
      inactiveColorPrimary: NEUTRAL_COLOR,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.person_fill),
      activeColorPrimary: MAIN_COLOR,
      inactiveColorPrimary: NEUTRAL_COLOR,
    ),
  ];

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
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
    );
  }
}
