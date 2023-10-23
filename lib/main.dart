import 'package:mike/home.dart';
import 'HomePage.dart';
import 'package:flutter/material.dart';
import 'dark_light.dart';
import 'startScreen.dart';
import 'package:mike/Discover/login.dart';
import 'package:mike/Discover/signup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      // home: HomePage(),
      home: login_page(),
      // home: signup_page(),
    );
  }
}
