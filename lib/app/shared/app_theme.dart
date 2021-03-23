import 'package:flutter/material.dart';

class AlternativeColors {
  var backgroundColor = Color(0XFF090114);
  var redColor = Color(0XFFc70900);
  var greenColor = Color(0XFF14A336);
  var yellowColor = Color(0XFFebab00);
  var blueColor = Color(0XFF647aa3);
  var pinkColor = Color(0XFFff3247);
  var purpleColor = Color(0XFF54003f);
}

const brightness = Brightness.dark;
const primaryColor = Color(0XFF0b0118);
const accentColor = Color(0XFF8257E5);

ThemeData appTheme() {
  return ThemeData(
    //Colors
    primaryColor: primaryColor,
    accentColor: accentColor,
    brightness: brightness,

    //Fonts
    textTheme: new TextTheme(
      bodyText1: new TextStyle(
        fontFamily: "Montserrat",
      ),
      bodyText2: TextStyle(
        fontFamily: "Montserrat",
      ),
      button: TextStyle(
        fontFamily: "Montserrat",
      ),
      caption: TextStyle(
        fontFamily: "Montserrat",
      ),
      headline1: TextStyle(
        fontFamily: "Montserrat",
      ),
      headline2: TextStyle(
        fontFamily: "Montserrat",
      ),
      headline3: TextStyle(
        fontFamily: "Montserrat",
      ),
      headline4: TextStyle(
        fontFamily: "Montserrat",
      ),
      headline5: TextStyle(
        fontFamily: "Montserrat",
      ),
      overline: TextStyle(
        fontFamily: "Montserrat",
      ),
      subtitle1: TextStyle(
        fontFamily: "Montserrat",
      ),
      subtitle2: TextStyle(
        fontFamily: "Montserrat",
      ),
      headline6: TextStyle(
        fontFamily: "Montserrat",
      ),
    ),
  );
}
