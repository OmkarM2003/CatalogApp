import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:flutter_application_1/pages/homepage.dart';
import 'package:flutter_application_1/pages/loginpage.dart';
import 'package:google_fonts/google_fonts.dart';
=======
<<<<<<< Updated upstream
=======
import 'package:flutter_application_1/pages/homepage.dart';
import 'package:flutter_application_1/pages/loginpage.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';
>>>>>>> Stashed changes
>>>>>>> Stashed changes

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        fontFamily: GoogleFonts.lato().fontFamily
        ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
<<<<<<< Updated upstream
      initialRoute: "/login",
      routes: {
        "/": (context) => const loginpage(),
        "/login": (context) => const loginpage()
      },
=======
<<<<<<< Updated upstream
=======
      initialRoute: "/login",
      routes: {
        "/": (context) => const loginpage(),
        MyRoutes.homeRoute : (context) => homepage(),
        "/login": (context) => const loginpage()
      },
>>>>>>> Stashed changes
>>>>>>> Stashed changes
    );
  }
}
