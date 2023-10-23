import 'package:flutter/material.dart';

class MyThemes {
  static final darkTheme = ThemeData(
      colorScheme: ColorScheme.dark(),
      primaryColor: Colors.white,
      hintColor: Colors.white.withOpacity(0.7),
      primaryColorLight: Colors.black,
      backgroundColor: Colors.black,
      bottomAppBarColor: Color.fromRGBO(15, 15, 150, 1),
      appBarTheme: AppBarTheme(backgroundColor: Colors.black),
      cardColor: Colors.pink,
      iconTheme: IconThemeData(color: Colors.white));

  static final lightTheme = ThemeData(
      colorScheme: ColorScheme.light(),
      bottomAppBarColor: Colors.white,
      primaryColor: Colors.black,
      primaryColorLight: Colors.white,
      cardColor: Colors.pink,
      hintColor: Color.fromRGBO(15, 15, 150, 1).withOpacity(0.7),
      backgroundColor: Colors.white,
      appBarTheme: AppBarTheme(backgroundColor: Colors.white),
      iconTheme: IconThemeData(color: Color.fromRGBO(15, 15, 150, 1)));
}
