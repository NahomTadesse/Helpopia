import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

class StartHelpopia extends StatefulWidget {
  @override
  _StartHelpopiaState createState() => _StartHelpopiaState();
}

class _StartHelpopiaState extends State<StartHelpopia> {
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 4,
        title: Center(
          child: Text(
            "Start Helpopia",
            style: TextStyle(
                letterSpacing: 1,
                color: isDarkMode ? Colors.pink : Colors.pink,
                fontWeight: FontWeight.w900,
                fontFamily: "Poppins",
                fontSize: 18),
          ),
        ),
      ),
      body: Container(
        child: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      child: CreateHelpopiaPage(),
                      type: PageTransitionType.rightToLeft));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(18),
              child: Text(
                "Start Helpopia",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontFamily: "Poppins",
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CreateHelpopiaPage extends StatefulWidget {
  @override
  _CreateHelpopiaPageState createState() => _CreateHelpopiaPageState();
}

class _CreateHelpopiaPageState extends State<CreateHelpopiaPage> {
  String city;

  TextEditingController firstNameController;
  static String formatter(String currentBalance) {
    try {
      // suffix = {' ', 'k', 'M', 'B', 'T', 'P', 'E'};
      double value = double.parse(currentBalance);

      if (value < 1000000) {
        // less than a million
        return value.toStringAsFixed(2);
      } else if (value >= 1000000 && value < (1000000 * 10 * 100)) {
        // less than 100 million
        double result = value / 1000000;
        return result.toStringAsFixed(2) + "M";
      } else if (value >= (1000000 * 10 * 100) &&
          value < (1000000 * 10 * 100 * 100)) {
        // less than 100 billion
        double result = value / (1000000 * 10 * 100);
        return result.toStringAsFixed(2) + "B";
      } else if (value >= (1000000 * 10 * 100 * 100) &&
          value < (1000000 * 10 * 100 * 100 * 100)) {
        // less than 100 trillion
        double result = value / (1000000 * 10 * 100 * 100);
        return result.toStringAsFixed(2) + "T";
      }
    } catch (e) {
      print(e);
    }
  }

  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back_ios_rounded,
                size: 20, color: Theme.of(context).primaryColor)),
        title: Center(
            child: Text(
          "Start your Helpopia",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            color: isDarkMode ? Colors.white : Theme.of(context).cardColor,
          ),
        )),
        // backgroundColor: Color.fromRGBO(45, 45, 214, 1),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 4,
      ),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(
                // left: 18.0,
                // top: 18,
                //right: 38.0,
                ),
            child: ContainedTabBarView(
              tabBarProperties: TabBarProperties(
                indicatorColor: Colors.pink,
              ),
              tabs: [
                Text(
                  'Welcome',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.5,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w800),
                ),
                // Text(
                //   'Second',
                //   style: TextStyle(
                //       color: Colors.black,
                //       fontSize: 14.5,
                //       fontFamily: "Poppins",
                //       fontWeight: FontWeight.w800),
                // ),
                // Text(
                //   'Second',
                //   style: TextStyle(
                //       color: Colors.black,
                //       fontSize: 14.5,
                //       fontFamily: "Poppins",
                //       fontWeight: FontWeight.w800),
                // ),
              ],
              views: [
                Container(
                  padding: const EdgeInsets.only(
                    left: 18.0,
                    // top: 18,
                    right: 38.0,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        textfield(
                          Name: "Title",
                          controller: firstNameController,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        textfield(
                          Name: "Name : If the account is not yours",
                          controller: firstNameController,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text("Describe the Problem",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            )),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          margin: const EdgeInsets.only(top: 18),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26),
                              borderRadius: BorderRadius.circular(6)),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15),
                            child: TextField(
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                              keyboardType: TextInputType.multiline,
                              minLines: 1,
                              maxLines: 11,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        DropdownButton(
                          hint: Text(
                            'Select city',
                            style: TextStyle(color: Colors.pink),
                          ), // Not necessary for Option 1
                          value: city,
                          onChanged: (newValue) {
                            setState(() {
                              city = newValue;
                            });
                          },
                          items: <String>[
                            'Addis Ababa',
                            'Hawassa',
                            'DireDewa',
                            'Nazret'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text("How much money do you need?",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: TextField(
                            controller: controller,
                            decoration: InputDecoration(
                                suffixText: "birr",
                                suffixStyle: TextStyle(color: Colors.black)),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        /////////////////////////////////////////////////////////////////////
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            GestureDetector(
                              // onTap: () {
                              //   Navigator.push(
                              //       context,
                              //       PageTransition(
                              //           child: CreateHelpopiaPage(),
                              //           type: PageTransitionType.rightToLeft)
                              //           );
                              // },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius: BorderRadius.circular(5)),
                                padding: EdgeInsets.all(18),
                                child: Text(
                                  "Upload Image",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Poppins",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 2),
                                ),
                              ),
                            ),
                          ],
                        ),

                        /////////////////////////////////////////////////////////////////
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: CreateHelpopiaPage(),
                                          type:
                                              PageTransitionType.rightToLeft));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.all(18),
                                  child: Text(
                                    "Finish",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 2),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Text(10000000.toString().replaceAllMapped(
                        //     new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                        //     (Match m) => '${m[1]},')),
                      ],
                    ),
                  ),
                ),
                // SingleChildScrollView(
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       SizedBox(
                //         height: 25,
                //       ),
                //       Text("What do you want the fund for?",
                //           style: TextStyle(
                //             fontWeight: FontWeight.w400,
                //             fontSize: 16,
                //           )),
                //       Padding(
                //         padding: const EdgeInsets.only(bottom: 20),
                //         child: TextField(),
                //       ),
                //       Text("Describe the Problem",
                //           style: TextStyle(
                //             fontWeight: FontWeight.w400,
                //             fontSize: 16,
                //           )),
                //       Container(
                //         height: MediaQuery.of(context).size.height * 0.3,
                //         margin: const EdgeInsets.only(top: 18),
                //         decoration: BoxDecoration(
                //             border: Border.all(color: Colors.black26),
                //             borderRadius: BorderRadius.circular(6)),
                //         child: Padding(
                //           padding: const EdgeInsets.only(left: 15.0, right: 15),
                //           child: TextField(
                //             decoration:
                //                 InputDecoration(border: InputBorder.none),
                //             keyboardType: TextInputType.multiline,
                //             minLines: 1,
                //             maxLines: 11,
                //           ),
                //         ),
                //       ),
                //       SizedBox(
                //         height: 5,
                //       ),
                //       DropdownButton(
                //         hint: Text('Select city'), // Not necessary for Option 1
                //         value: city,
                //         onChanged: (newValue) {
                //           setState(() {
                //             city = newValue;
                //           });
                //         },
                //         items: <String>[
                //           'Addis Ababa',
                //           'Hawassa',
                //           'DireDewa',
                //           'Nazret'
                //         ].map((String value) {
                //           return DropdownMenuItem<String>(
                //             value: value,
                //             child: new Text(value),
                //           );
                //         }).toList(),
                //       ),
                //       Text("How much money do you need?",
                //           style: TextStyle(
                //             fontWeight: FontWeight.w400,
                //             fontSize: 16,
                //           )),
                //       Padding(
                //         padding: const EdgeInsets.only(bottom: 20),
                //         child: TextField(
                //           controller: controller,
                //           decoration: InputDecoration(
                //               suffixText: "birr",
                //               suffixStyle: TextStyle(color: Colors.black)),
                //         ),
                //       ),
                //       Center(
                //         child: Expanded(
                //           child: GestureDetector(
                //             onTap: () {
                //               Navigator.push(
                //                   context,
                //                   PageTransition(
                //                       child: CreateHelpopiaPage(),
                //                       type: PageTransitionType.rightToLeft));
                //             },
                //             child: Container(
                //               decoration: BoxDecoration(
                //                   color: Color.fromRGBO(15, 15, 150, 1),
                //                   borderRadius: BorderRadius.circular(10)),
                //               padding: EdgeInsets.all(18),
                //               child: Text(
                //                 "Continue",
                //                 style: TextStyle(
                //                     color: Colors.white,
                //                     fontFamily: "Poppins",
                //                     fontSize: 15,
                //                     fontWeight: FontWeight.w600,
                //                     letterSpacing: 2),
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //       Text(10000000.toString().replaceAllMapped(
                //           new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                //           (Match m) => '${m[1]},')),
                //     ],
                //   ),
                // ),
                // Container()
              ],
              onChange: (index) => print(index),
            ),
          ),
        ),
      ),
    );
  }
}

class textfield extends StatelessWidget {
  textfield({
    this.Name,
    this.controller,
  });

  final String Name;
  final TextEditingController controller;

  String get _errorText {
    final text = controller.value.text;
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    return null;
  }

  AlertDialog alertt() {
    return AlertDialog(
      title: Text("My title"),
      content: Text("This is my message."),
    );
  }

  bool errorStat = false;
  String error = "";

  UnderlineInputBorder myinputborder() {
    //return type is OutlineInputBorder
    return UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: Color(0xFF082534),
          width: 0.0,
        ));
  }

  UnderlineInputBorder myfocusborder() {
    return UnderlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(7)),
        borderSide: BorderSide(
          color: Color(0xFF082534),
          width: 1,
        ));
    focusedBorder:
    UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white.withOpacity(0.5)));
  }

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: TextFormField(
        onSaved: (value) {
          controller.text != value;
          print(controller.text);
        },
        controller: controller,
        cursorColor: Color(0xFF082534),
        style: TextStyle(
          fontSize: 13,
          fontFamily: "Poppins",
          fontWeight: FontWeight.bold,
        ),
        decoration: errorStat
            ? InputDecoration(
                contentPadding: EdgeInsets.all(100),
                errorText: _errorText,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        width: 1.5,
                        color: isDarkMode
                            ? Colors.white.withOpacity(0.7)
                            : Color(0xFF082534).withOpacity(0.5))),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: isDarkMode
                            ? Colors.white.withOpacity(0.5)
                            : Color(0xFF082534))),
                hintStyle: TextStyle(
                    color: Theme.of(context).primaryColor.withOpacity(0.7),
                    fontSize: 5),
                labelText: Name,
                labelStyle: TextStyle(
                    fontSize: 7,
                    fontFamily: "Poppins",
                    color: Theme.of(context).primaryColor.withOpacity(0.7)),
              )
            : InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                border: myinputborder(), //normal border
                enabledBorder: myinputborder(), //enabled border
                focusedBorder: myfocusborder(),
                hintStyle: TextStyle(
                    color: Theme.of(context).primaryColor.withOpacity(0.7),
                    fontSize: 7),
                labelText: Name,
                labelStyle: TextStyle(
                    fontSize: 13,
                    fontFamily: "Poppins",
                    color: Theme.of(context).primaryColor.withOpacity(0.7)),
              ),
      ),
    );
  }
}
