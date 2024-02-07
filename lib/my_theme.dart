import 'package:flutter/material.dart';

class MyTheme {
  // colors , light theme , dark theme
  static Color primaryColor = Color(0xff5D9CEC);
  static Color whiteColor = Color(0xffffffff);
  static Color blackColor = Color(0xff383838);
  static Color greenColor = Color(0xff61E757);
  static Color redColor = Color(0xffEC4B4B);
  static Color grayColor = Color(0xff958b8b);
  static Color backgroundLightColor = Color(0xffDFECDB);
  static Color backgroundDarkColor = Color(0xff060E1E);
  static Color blackDarkColor = Color(0xff141922);

  static ThemeData lightTheme = ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundLightColor,
      appBarTheme: AppBarTheme(
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          unselectedItemColor: grayColor,
          backgroundColor: Colors.transparent,
          elevation: 0),
      bottomSheetTheme: BottomSheetThemeData(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
              side: BorderSide(color: primaryColor, width: 4))),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColor,
          shape: StadiumBorder(side: BorderSide(color: whiteColor, width: 3))
          // RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(35) ,
          //   side: BorderSide(
          //     color: whiteColor,
          //     width: 3
          //   )
          // )
          ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: whiteColor),
        titleMedium: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: blackColor),
        titleSmall: TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: blackColor),
      ));
}
