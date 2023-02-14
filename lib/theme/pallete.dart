import 'package:flutter/material.dart';

class Pallete {
  static const backgroundColor = Color.fromRGBO(238, 241, 255, 1.0);
  static const buttonColor = Color.fromRGBO(210, 218, 255, 1.0);
  static const buttonColor2 = Color.fromRGBO(170, 196, 255, 1.0);
  static const appbarColor = Color.fromRGBO(177, 178, 255, 1.0);
  static const appbarColor2 = Color.fromRGBO(238, 241, 255, 1.0);

  static const blackColor = Color.fromRGBO(1, 1, 1, 1); // primary color
  static const greyColor = Color.fromRGBO(26, 39, 45, 1); // secondary color
  static const drawerColor = Color.fromRGBO(18, 18, 18, 1);
  static const whiteColor = Colors.white;
  static var redColor = Colors.red.shade500;
  static var blueColor = Colors.blue.shade300;

  static var lightModeAppTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: backgroundColor,
    cardColor: buttonColor2,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: appbarColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: buttonColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: appbarColor,
    ),
    primaryColor: redColor,
  );

  static var darkModeAppTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: blackColor,
    cardColor: greyColor,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: backgroundColor,
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: drawerColor,
    ),
    primaryColor: redColor,
  );
}
