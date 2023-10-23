import 'package:flutter/material.dart';
import 'package:mike/Discover/login.dart';
import 'package:mike/Discover/signup.dart';
import 'package:page_transition/page_transition.dart';

class start_page extends StatefulWidget {
  @override
  _start_pageState createState() => _start_pageState();
}

class _start_pageState extends State<start_page> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(bottom: 30),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Theme.of(context).cardColor,
            Theme.of(context).cardColor,
            Theme.of(context).cardColor,
            Theme.of(context).cardColor.withOpacity(0.9),
            Colors.white,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: login_page()));
                  // Navigator.pushNamed(context, '/login_page');
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Theme.of(context).backgroundColor,
                  ),
                  width: MediaQuery.of(context).size.width * 0.7,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Center(
                      child: Text(
                    "LOGIN",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        letterSpacing: 2,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: signup_page()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(blurRadius: 0.4, color: Colors.white)
                    // ],
                    borderRadius: BorderRadius.circular(40),
                    color: Theme.of(context).cardColor,
                  ),
                  width: MediaQuery.of(context).size.width * 0.7,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Center(
                      child: Text(
                    "SIGNUP",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontFamily: "Poppins",
                        letterSpacing: 2,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
