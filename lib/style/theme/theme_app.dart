import 'package:flutter/material.dart';

class AppStyle{
  static Color secondaryColor = Color(0xff121312);
  static Color canvasColor = Color(0xff1A1A1A);
  static Color primaryColor = Color(0xffC6C6C6);
  static Color genreColor = Color(0xffCBCBCB);
  static Color itemBackColor = Color(0xff343534);
  static Color containerBack = Color(0xff282A28);
  static Color date_type_color = Color(0xffB5B4B4);
  static Color bottomNavSelectedColor = Color(0xffFFBB3B);
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: secondaryColor,
    canvasColor: canvasColor,
    primaryColor: primaryColor,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 10,
        color: Colors.white,
        fontWeight: FontWeight.bold
      ),
      displaySmall: TextStyle(
        fontSize: 8,
        color: date_type_color
      ),
      displayMedium: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold
      ),
      bodySmall: TextStyle(
        fontSize: 10,
        color: date_type_color
      ),
      bodyMedium: TextStyle(
        fontSize: 13,
        color: genreColor
      )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: canvasColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: primaryColor,
      selectedItemColor: bottomNavSelectedColor
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w600
      )
    )
  );
}