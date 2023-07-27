import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  // ignore: non_constant_identifier_names
  static ThemeData LightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            // Set your desired TextStyle properties here
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  // ignore: non_constant_identifier_names
  static ThemeData DarkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
      );

  static Color Color1 = Color(0xFFFF0000);
  static Color Color2 = Color(0xFF333333);
  static Color Color3 = Color(0xFFF9F9F9);
}
