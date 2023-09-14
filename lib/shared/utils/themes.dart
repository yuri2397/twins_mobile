import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twins/shared/utils/colors.dart';

final defaultTheme = ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(),
    primaryColor: MAIN_COLOR,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: PRIMARY_COLOR),
    hintColor: NEUTRAL_COLOR,
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: MAIN_COLOR, fontFamily: "Poppins"),
      hintStyle: TextStyle(color: MAIN_COLOR, fontFamily: "Poppins"),
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
        elevation: 0,
        titleTextStyle: TextStyle(
            color: DARK_COLOR,
            fontFamily: "Poppins",
            fontSize: 16,
            fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: DARK_COLOR)));
