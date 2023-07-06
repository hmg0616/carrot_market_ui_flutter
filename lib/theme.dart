import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: textTheme(),
    appBarTheme: appTheme(),
    primaryColor: Colors.orange // 앱의 브랜드 색상 설정
  );
}

TextTheme textTheme() {
  return TextTheme( // TextTheme 재정의
    headline1: GoogleFonts.openSans(fontSize: 18.0, color: Colors.black), // H1
    headline2: GoogleFonts.openSans(fontSize: 16.0, color: Colors.black, fontWeight: FontWeight.bold), // H2
    bodyText1: GoogleFonts.openSans(fontSize: 16.0, color: Colors.black),
    bodyText2: GoogleFonts.openSans(fontSize: 14.0, color: Colors.grey),
    subtitle1: GoogleFonts.openSans(fontSize: 15.0, color: Colors.black),
  );
}

AppBarTheme appTheme() {
  return AppBarTheme(
    centerTitle: false,
    color: Colors.white,
    elevation: 0.0,
    titleTextStyle: textTheme().headline6,
  );
}