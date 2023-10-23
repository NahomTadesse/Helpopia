import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mike/HomePage.dart';
import 'package:mike/Discover/signup.dart';
import 'package:mike/Discover/ForgetPassword.dart';

import 'package:page_transition/page_transition.dart';

class login_page extends StatefulWidget {
  @override
  _login_pageState createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String phoneeNumber = 'default';

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios, color: Colors.pink)),
            title: Text("LOGIN",
                style: TextStyle(
                    color: Colors.pink,
                    decoration: TextDecoration.none,
                    fontFamily: "Poppins",
                    letterSpacing: 3,
                    fontSize: 17,
                    fontWeight: FontWeight.bold)),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
              //     gradient: LinearGradient(colors: [
              //   Theme.of(context).cardColor,
              //   Theme.of(context).cardColor,
              //   Theme.of(context).cardColor,
              //   Theme.of(context).cardColor.withOpacity(0.9),
              //   Colors.white,
              // ],
              // begin: Alignment.topCenter, end: Alignment.bottomCenter
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 30, right: 30),
                      //width: MediaQuery.of(context).size.width * 0.55,
                      //  height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).primaryColorLight,
                            offset: Offset(0, 0),
                            blurRadius: 2,
                            spreadRadius: 0.5,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 18.0, bottom: 18),
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      letterSpacing: 3,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Divider(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.6),
                                indent: 28,
                                endIndent: 28,
                              ),
                            ],
                          ),
                          TextFieldNew(
                              Name: "Email",
                              short: false,
                              controller: emailController),
                          TextFieldPassword(
                              Name: "Password",
                              short: false,
                              controller: passwordController),
                          SizedBox(height: 10.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          child: HomePage()));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 4,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(40),
                                    color: Theme.of(context).cardColor,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  child: Center(
                                      child: Text(
                                    "LOGIN",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        letterSpacing: 2,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              forgot_password()));
                                },
                                child: Text(
                                  "Forgot Password",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    //letterSpacing: 3,
                                    color: Colors.blue,
                                    // fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => signup_page()));
                                },
                                child: Text(
                                  "Don't Have an Account? Sign Up",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    //letterSpacing: 3,
                                    color: Colors.blue,
                                    // fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 28),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.white,
                                ),
                                width: MediaQuery.of(context).size.width * 0.7,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.google,
                                        color:
                                            Color.fromARGB(255, 10, 123, 216),
                                      ),
                                      Text(
                                        "Continue with Google",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Poppins",
                                            letterSpacing: 2,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 28),
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.2),
                                      spreadRadius: 2,
                                      blurRadius: 4,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.white,
                                ),
                                width: MediaQuery.of(context).size.width * 0.7,
                                padding: EdgeInsets.symmetric(vertical: 15),
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.phone,
                                        color:
                                            Color.fromARGB(255, 10, 123, 216),
                                      ),
                                      Text(
                                        "Continue with Phone",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: "Poppins",
                                            letterSpacing: 2,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldNew extends StatelessWidget {
  const TextFieldNew({this.Name, this.short, this.controller});

  final String Name;
  final bool short;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;

    return Container(
      width: 250,
      child: TextFormField(
        keyboardType: Name == 'Email' ? TextInputType.emailAddress : null,
        onSaved: (value) {
          controller.text != value;
          print(controller.text);
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,

        controller: controller,
        cursorColor: Color(0xFF082534),
        // autofocus: Name == "Email" || Name == "First Name" ? true : false,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: isDarkMode
                      ? Colors.white.withOpacity(0.7)
                      : Color(0xFF082534).withOpacity(0.5))),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: isDarkMode
                      ? Colors.white.withOpacity(0.5)
                      : Color(0xFF082534))),
          labelText: Name,
          labelStyle: TextStyle(
              fontSize: 13,
              fontFamily: "Poppins",
              color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}

class TextFieldPassword extends StatefulWidget {
  const TextFieldPassword({this.Name, this.short, this.controller});

  final String Name;
  final bool short;
  final TextEditingController controller;

  @override
  State<TextFieldPassword> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;
    var showpass = CupertinoIcons.eye_fill;
    var dontshowpass = CupertinoIcons.eye;

    var currentstatus = {'true': showpass, 'false': dontshowpass};
    return Container(
      width: 250,
      child: Stack(
        children: [
          TextFormField(
            obscureText: visible == true ? false : true,
            onSaved: (value) {
              widget.controller.text != value;
              print(widget.controller.text);
            },
            // validator: (value) {
            //   return "Empty values are not allowed";
            // },
            controller: widget.controller,
            cursorColor: Color(0xFF082534),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: isDarkMode
                          ? Colors.white.withOpacity(0.7)
                          : Color(0xFF082534).withOpacity(0.5))),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: isDarkMode
                          ? Colors.white.withOpacity(0.5)
                          : Color(0xFF082534))),
              labelText: widget.Name,
              labelStyle: TextStyle(
                  fontSize: 13,
                  fontFamily: "Poppins",
                  color: Theme.of(context).primaryColor),
            ),
          ),
          GestureDetector(
              onTap: () {
                setState(() {
                  if (visible == false) {
                    visible = true;
                  } else if (visible == true) {
                    visible = false;
                  }
                  print(visible);
                });
              },
              child: Align(
                  alignment: Alignment.bottomRight,
                  heightFactor: 1.5,
                  child: Icon(currentstatus[visible.toString()])))
        ],
      ),
    );
  }
}
