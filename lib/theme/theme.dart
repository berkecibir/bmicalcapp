import 'package:flutter/material.dart';

class AppTheme {
  ThemeData themeData = ThemeData.dark().copyWith(
    primaryColor: const Color(0xff0A0E21),
    scaffoldBackgroundColor: const Color(0xff0A0E21),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      foregroundColor: Color(0xffFFFFFF),
      backgroundColor: Color(0xff0A0E21),
    ),
  );
}
