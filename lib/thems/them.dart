
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes{
  final lightThem=ThemeData.light(
  ).copyWith(
    primaryColor: Colors.deepPurple[300],
    textTheme: GoogleFonts.latoTextTheme(
    ),

    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark, toolbarTextStyle: TextTheme(headline1: GoogleFonts.poppins(
        color: Colors.black,
      ),

      ).bodyText2, titleTextStyle: TextTheme(headline1: GoogleFonts.poppins(
        color: Colors.black,
      ),

      ).headline6,
    ),
      buttonColor: Colors.pink,
  );
  final darkThem=ThemeData.dark().copyWith(
    primaryColor: Colors.blueGrey[800],
    textTheme: GoogleFonts.latoTextTheme(
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light, toolbarTextStyle: TextTheme(headline1: GoogleFonts.poppins(
        color: Colors.white,
      ),
      ).bodyText2, titleTextStyle: TextTheme(headline1: GoogleFonts.poppins(
        color: Colors.white,
      ),
      ).headline6,
    ),
    buttonColor: Colors.green,
  );
}