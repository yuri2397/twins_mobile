import 'package:flutter/material.dart';
import 'package:twinz/shared/utils/colors.dart';

class TwinsButton extends ElevatedButton {
  TwinsButton({super.key, super.onPressed, super.child})
      : super(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: MAIN_COLOR,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))));
}
