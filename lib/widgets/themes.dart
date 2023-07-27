import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  // ignore: non_constant_identifier_names
  static ThemeData LightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: MyTheme.Color2,
        canvasColor: MyTheme.Color3,
        primaryColor: MyTheme.Color1,
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
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: MyTheme.Color3,
        canvasColor: MyTheme.Dark,
        primaryColor: MyTheme.Color1,
        appBarTheme: const AppBarTheme(
          color: Colors.black,
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

  static Color Color1 = Color.fromARGB(255, 0, 0, 0);
  static Color Color2 = Color(0xFF333333);
  static Color Color3 = Color(0xFFF9F9F9);
  static Color Dark = Color.fromARGB(255, 27, 26, 26);
  static Color LDark = Color.fromARGB(255, 34, 32, 32);
}
