import 'package:flutter/material.dart';

import 'package:mike/Discover/login.dart';
import 'package:page_transition/page_transition.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../HomePage.dart';

class signup_page extends StatefulWidget {
  @override
  _signup_pageState createState() => _signup_pageState();
}

enum authProblems { UserNotFound, PasswordNotValid, NetworkError }

class _signup_pageState extends State<signup_page> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String phoneeNumber = 'default';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_ios, color: Colors.pink)),
            actions: [
              // Padding(
              //   padding: const EdgeInsets.all(4.0),
              //   child: Hero(
              //     tag: "image",
              //     child: Image(
              //       image: AssetImage("assets/logo.png"),
              //     ),
              //   ),
              // )
            ],
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text("SIGNUP",
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
              //     gradient: LinearGradient(colors: [
              //   Color(0xFF082534),
              //   Color(0xFF082534),
              //   Color(0xFF082534),
              //   Color(0xFF082534).withOpacity(0.9),
              //   Colors.white,
              // ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
              color: Colors.white,
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        // height: MediaQuery.of(context).size.height * 0.5,
                        decoration: BoxDecoration(
                            color: Theme.of(context).backgroundColor,
                            borderRadius: BorderRadius.circular(23)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 28.0, bottom: 18),
                                  child: Text(
                                    "SIGNUP",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        letterSpacing: 3,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Divider(
                                  color: Colors.black.withOpacity(0.6),
                                  indent: 28,
                                  endIndent: 28,
                                ),
                              ],
                            ),
                            TextFieldNew(
                                Name: "First Name",
                                short: false,
                                controller: firstNameController),
                            TextFieldNew(
                                Name: "Last Name",
                                short: false,
                                controller: lastNameController),
                            TextFieldNew(
                                Name: "Email",
                                short: false,
                                controller: emailController),
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            //   child: IntlPhoneField(
                            //     showCountryFlag: false,
                            //     readOnly: false,
                            //     decoration: InputDecoration(
                            //       labelText: 'Phone Number',
                            //     ),
                            //     onChanged: (phone) {
                            //       phoneeNumber = phone.completeNumber.toString();
                            //     },
                            //     onCountryChanged: (phone) {
                            //       //print('Country code changed to: ' + phone.countryCode);
                            //     },
                            //   ),
                            // ),
                            // Container(
                            //   width: 250,
                            //   child: IntlPhoneField(
                            //     controller: phoneController,
                            //     showCountryFlag: false,
                            //     readOnly: false,
                            //     style: TextStyle(fontSize: 13),
                            //     decoration: InputDecoration(
                            //       labelText: 'Phone Number',
                            //       labelStyle: TextStyle(
                            //           fontSize: 13,
                            //           fontFamily: "Poppins",
                            //           color:
                            //               Theme.of(context).primaryColor),
                            //     ),
                            //     onChanged: (phone) {
                            //       //print(phone.completeNumber);
                            //     },
                            //     onCountryChanged: (phone) {
                            //       //print('Country code changed to: ' + phone.countryCode);
                            //     },
                            //   ),
                            // ),
                            TextFieldNew(
                              Name: "Password",
                              short: false,
                              controller: passwordController,
                            ),
                            TextFieldNew(
                                Name: "Confirm Password",
                                short: false,
                                controller: confirmPasswordController),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.rightToLeft,
                                        child: HomePage()));
                              },
                              child: Center(
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 20),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 0.4, color: Colors.white)
                                    ],
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.pink,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  child: Center(
                                      child: Text(
                                    "Signup",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        letterSpacing: 2,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.google,
                                      color: Color.fromARGB(255, 10, 123, 216),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.phone,
                                      color: Color.fromARGB(255, 10, 123, 216),
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
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
