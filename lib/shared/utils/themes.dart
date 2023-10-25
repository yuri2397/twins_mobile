import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twinz/shared/utils/colors.dart';

final defaultTheme = ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(),
    primaryColor: MAIN_COLOR,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: PRIMARY_COLOR),
    hintColor: NEUTRAL_COLOR,
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: MAIN_COLOR, fontFamily: "Haylard"),
      hintStyle: TextStyle(color: MAIN_COLOR, fontFamily: "Haylard"),
    ),
    shadowColor: const Color.fromARGB(200, 158, 158, 158).withOpacity(0.5),
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: DARK_COLOR,
      selectedItemColor: Colors.white,
      unselectedItemColor: NEUTRAL_COLOR,
    ),
    appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 6,
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: MAIN_COLOR,
            fontFamily: "Haylard",
            fontSize: 20,
            fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: MAIN_COLOR)));
