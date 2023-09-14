import 'package:flutter/material.dart';
import 'package:twins/shared/utils/colors.dart';

class TwinsInput extends TextFormField {
  String? label;
  Widget? suffix;
  Widget? prefix;
  TwinsInput(
      {super.key,
      this.label,
      super.style,
      super.onChanged,
      super.validator,
      super.onSaved,
      super.focusNode,
      super.cursorColor,
      this.prefix,
      this.suffix,
      super.keyboardAppearance,
      super.keyboardType,
      super.obscureText})
      : super(
            decoration: InputDecoration(
                prefix: prefix,
                suffix: suffix,
                errorStyle:
                    const TextStyle(color: Color.fromARGB(255, 255, 125, 116)),
                label: Text(
                  label ?? "",
                  style: const TextStyle(
                      fontFamily: "Poppins", color: Colors.white),
                ),
                border: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.5),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 1.5),
                    borderRadius: BorderRadius.circular(10)),
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 255, 125, 116), width: 1.5),
                    borderRadius: BorderRadius.circular(10)),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                fillColor: Colors.white.withOpacity(.2),
                filled: true));
}
