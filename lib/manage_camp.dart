import 'package:flutter/material.dart';
import 'package:mike/camp_card.dart';

class UserCampaignPage extends StatefulWidget {
  @override
  _UserCampaignPage createState() => _UserCampaignPage();
}

class _UserCampaignPage extends State<UserCampaignPage> {
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
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back_ios_rounded,
                  size: 20, color: Theme.of(context).primaryColor)),
          title: Center(
            child: Text(
              "My Campaigns",
              style: TextStyle(
                  letterSpacing: 1,
                  color:
                      isDarkMode ? Colors.white : Theme.of(context).cardColor,
                  fontWeight: FontWeight.w900,
                  fontFamily: "Poppins",
                  fontSize: 18),
            ),
          ),
        ),
        body: ListView(
          children: [
            CampaignCards(
              title: 'Help this poor kid get all the medical\ncare he can get',
              raisedmoney: 50000,
              moneytoberaised: 50000,
              status: 'Open',
            ),
            CampaignCards(
              title: 'Help this poor kid get all the medical\ncare he can get',
              raisedmoney: 24000,
              moneytoberaised: 75000,
              status: 'Closed',
            ),
            CampaignCards(
              title: 'Help this poor kid get all the medical\ncare he can get',
              raisedmoney: 2000,
              moneytoberaised: 5000,
              status: 'Cancelled',
            ),
          ],
        ),
      ),
    );
  }
}
