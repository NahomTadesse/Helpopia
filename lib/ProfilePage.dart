import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mike/profilePageReusable.dart';
import 'package:mike/edit_profile.dart';
import 'package:mike/manage_camp.dart';
import 'package:mike/Discover/login.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color.fromRGBO(45, 45, 214, 1),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 4,
        title: Center(
          child: Text(
            "Settings",
            style: TextStyle(
                letterSpacing: 1,
                color:
                     isDarkMode ? Colors.white : Theme.of(context).cardColor,
                fontWeight: FontWeight.w800,
                fontFamily: "Poppins",
                fontSize: 18),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditProfilePage()));
              },
              child: Setting_Cards(
                icon: Icons.settings,
                text: "Account Settings",
                color: Colors.blue,
              ),
            ),
            Setting_Cards(
              icon: Icons.account_balance_wallet,
              text: "Payment Method",
              color: Colors.green,
            ),
            GestureDetector(
                child: Setting_Cards(
                  icon: Icons.person,
                  text: "Campaigns",
                  color: Colors.red,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserCampaignPage()),
                  );
                }),
            Setting_Cards(
              icon: Icons.help_outline,
              text: "Help",
              color: Colors.orange,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => login_page()));
              },
              child: Setting_Cards(
                  icon: Icons.logout,
                  text: "Sign out",
                  color: Colors.deepOrangeAccent),
            ),
          ],
        ),
      ),
    );
  }
}
