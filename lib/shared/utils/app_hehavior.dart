import 'package:flutter/material.dart';

class AppBehavior extends ScrollBehavior {
  const AppBehavior();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const BouncingScrollPhysics();

  @override
  Widget buildViewportChrome(
          BuildContext context, Widget child, AxisDirection axisDirection) =>
      child;

  @override
  bool shouldNotify(AppBehavior oldDelegate) => false;
}
