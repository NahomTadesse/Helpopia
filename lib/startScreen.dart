import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mike/HomePage.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:page_transition/page_transition.dart';

class MyNavigator {
  static void goToHome(BuildContext context) {
    Navigator.pushNamed(context, "/home");
  }
}

class Start_Page extends StatefulWidget {
  @override
  _Start_PageState createState() => _Start_PageState();
}

class _Start_PageState extends State<Start_Page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context,
            PageTransition(
                alignment: Alignment.center,
                type: PageTransitionType.scale,
                child: HomePage())));
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: Container(
        color: Theme.of(context).cardColor,
        //  color: Color.fromRGBO(15, 15, 190, 1),
        child: Center(
            child: Text(
          "Helpopia",
          style: TextStyle(
            fontFamily: "Poppins",
            // color: Colors.white,
            letterSpacing: 3,
            color: Color.fromRGBO(15, 15, 190, 1),
            fontSize: 40.0,
            fontWeight: FontWeight.w800,
          ),
        )
            // child:
            //  child: TextLiquidFill(
            //    text: 'Helpopia',
            //    waveColor: Colors.white,
            //    boxBackgroundColor: Color.fromRGBO(15, 15, 190, 1),
            //    textStyle: TextStyle(
            //      fontSize: 60.0,
            //      fontWeight: FontWeight.bold,
            //      fontFamily: "myfont",
            //      color: Colors.white
            //    ),
            //    boxHeight: 300.0,
            //  ),
            ),
      )),
    );
  }
}
