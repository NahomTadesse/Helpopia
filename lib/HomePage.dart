import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:mike/ProfilePage.dart';
import 'Discover/DiscoverPage.dart';
import 'SearchPage.dart';
import 'StartHelpopia.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dark_light.dart';

class HomePage extends StatefulWidget {
  // HomePage({this.email});
  // String email;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final _auth= FirebaseAuth.instance;
  // User loggedUser;
  //
  // @override
  // void initState() {
  //
  //   super.initState();
  //   // currentUser();
  // }
  // void currentUser() async{
  //
  //   try{
  //   final user= await _auth.currentUser;
  //   if(user!=null){
  //       loggedUser=user;
  //       print(loggedUser.email);
  //   }}
  //   catch(e){print(e);}
  // }

  int currentIndex = 0;
  Color appColor = Color.fromRGBO(15, 15, 200, 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      // theme: ThemeData.dark( ),
      home: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          child: FFNavigationBar(
            theme: FFNavigationBarTheme(
                showSelectedItemShadow: false,
                barHeight: 44,
                barBackgroundColor:
                    Theme.of(context).appBarTheme.backgroundColor,
                selectedItemBackgroundColor: Theme.of(context).cardColor,
                selectedItemBorderColor: Colors.white10,
                selectedItemIconColor: Colors.white),
            selectedIndex: currentIndex,
            onSelectTab: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            items: [
              FFNavigationBarItem(
                iconData: CupertinoIcons.home,
                label: "",
              ),
              FFNavigationBarItem(
                iconData: CupertinoIcons.search,
                label: '',
              ),
              FFNavigationBarItem(
                iconData: Icons.apps_outlined,
                label: "",
              ),
              FFNavigationBarItem(
                iconData: CupertinoIcons.profile_circled,
                label: '',
              ),
            ],
          ),
        ),
        body: IndexedStack(
          children: [
            DiscoverPage(),
            SearchPage(),
            StartHelpopia(),
            ProfilePage(),
          ],
          index: currentIndex,
        ),
      ),
    );
  }
}
