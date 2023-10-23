import 'package:flutter/material.dart';
import 'package:mike/Discover/discoverReuseables.dart';

import '../database.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  Database db = Database();
  List<Widget> Discover = [
    DiscoverWidget(
      profile_image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ07zeNZT1JSS65hoqELUx5vv8ixiSPHar3pg&usqp=CAU",
      profile_name: "Abebe Kebede",
      name: "Abebe Kebede",
      image: AssetImage("assets/mike.jpg"),
      title: "Help this poor kid get all the medical care he can get",
      city: "Addis Ababa",
      country: "Ethiopia",
      moneyToBeRaised: 200000,
      raisedMoney: 75689,
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    ),
    DiscoverWidgetVerified(
      profile_image:
          "data:image/png;base64,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",
      profile_name: "Tikur Anbessa",
      name: "Yeab Girma",
      image: AssetImage("assets/mike2.jpg"),
      title: "Help this poor kid get all the medical care he can get",
      city: "Addis Ababa",
      country: "Ethiopia",
      moneyToBeRaised: 350000,
      raisedMoney: 158300,
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    ),
    DiscoverWidget(
      profile_image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6SKReD0y8g1ebDIIvKurmEKaEvPvYNLYK2Q&usqp=CAU",
      profile_name: "Michael Bizuneh",
      name: "Michael Bizuneh",
      image: AssetImage("assets/download3.jpg"),
      title: "Help this poor kid get all the medical care he can get",
      city: "Addis Ababa",
      country: "Ethiopia",
      moneyToBeRaised: 10000,
      raisedMoney: 8700,
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          elevation: 4,
          title: Center(
            child: Text(
              "Helpopia",
              style: TextStyle(
                  letterSpacing: 1,
                  color: isDarkMode ? Colors.pink : Theme.of(context).cardColor,
                  fontWeight: FontWeight.w900,
                  fontFamily: "Poppins",
                  fontSize: 18),
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Column(
              children: Discover,
            ),
          ),
        ),
      ),
    );
  }
}
