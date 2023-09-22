import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twins/shared/utils/colors.dart';

class GenderWidget extends StatefulWidget {
  Rx<String> gender = "male".obs;
  Function onChange;
  GenderWidget({super.key, required this.gender, required this.onChange});

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              widget.gender.value = "male";
              widget.onChange("male");
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: widget.gender.value == "male"
                      ? MAIN_COLOR
                      : Colors.white),
              child: Text(
                "Homme",
                style: TextStyle(
                    color: widget.gender.value != "male"
                        ? MAIN_COLOR
                        : Colors.white),
              ),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          GestureDetector(
            onTap: () {
              widget.gender.value = "female";
              widget.onChange("female");
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: widget.gender.value != "male"
                      ? MAIN_COLOR
                      : Colors.white),
              child: Text(
                "Femme",
                style: TextStyle(
                    color: widget.gender.value == "male"
                        ? MAIN_COLOR
                        : Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
