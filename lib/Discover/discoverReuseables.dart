import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'DiscoverDetail.dart';
import 'package:mike/User_profile_page.dart';

class DiscoverWidget extends StatefulWidget {
  DiscoverWidget(
      {this.profile_name,
      this.profile_image,
      this.city,
      this.country,
      this.moneyToBeRaised,
      this.raisedMoney,
      this.description,
      this.title,
      this.image,
      this.name});
  String profile_name;
  String profile_image;
  String city;
  String country;
  String description;
  String title;
  double raisedMoney;
  double moneyToBeRaised;
  ImageProvider image;
  String name;

  @override
  _DiscoverWidgetState createState() => _DiscoverWidgetState();
}

class _DiscoverWidgetState extends State<DiscoverWidget> {
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    double progressValue =
        (widget.raisedMoney * 100 / widget.moneyToBeRaised) / 100;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 10, blurRadius: 10)
          ],
          // border: Border.all(color: Colors.white),
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(15)),
      width: MediaQuery.of(context).size.width * 0.99,
      // height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            child: Row(
              children: <Widget>[
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10))
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            widget.profile_image,
                          ))),
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Text(
                      widget.profile_name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                SizedBox(width: 40),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                    alignment: Alignment.center,
                    type: PageTransitionType.rightToLeft,
                    child: DiscoverDetail(
                      name: widget.name,
                      description: widget.description,
                      title: widget.title,
                      image: widget.image,
                    ),
                    inheritTheme: true,
                    ctx: context),
              );
            },
            child: Column(
              children: [
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image(
                      image: widget.image,
                      width: MediaQuery.of(context).size.width * 0.99,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.45,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.city + ", " + widget.country,
                              style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: "Poppins",
                                  color: Theme.of(context).primaryColor),
                            ),
                            Text(
                              "12" + " days ago",
                              style: TextStyle(
                                fontSize: 11,
                                fontFamily: "Poppins",
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          widget.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              fontFamily: "Poppins"),
                        ),
                        SizedBox(
                          height: 13.5,
                        ),
                        Text(
                          widget.description,
                          style: TextStyle(fontSize: 11, fontFamily: "Poppins"),
                          maxLines: 3,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.012,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context)
                                      .cardColor
                                      .withOpacity(0.7),
                                  width: 0.5),
                              borderRadius: BorderRadius.circular(15)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LinearProgressIndicator(
                              value: progressValue,
                              backgroundColor: Colors.white,
                              valueColor: AlwaysStoppedAnimation(
                                  Theme.of(context).cardColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.raisedMoney.toString().replaceAllMapped(
                                      new RegExp(
                                          r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                      (Match m) => '${m[1]},') +
                                  " Etb",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12,
                                  fontFamily: "Poppins"),
                            ),
                            Text(" of"),
                            Text(
                              widget.moneyToBeRaised
                                      .toString()
                                      .replaceAllMapped(
                                          new RegExp(
                                              r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                          (Match m) => '${m[1]},') +
                                  " Etb",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  fontFamily: "Poppins"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          child: Container(
                            color: isDarkMode ? Colors.white : Colors.white,
                            height: 200,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                      color: isDarkMode ? Colors.blue : null,
                                      // color: Colors.blue,
                                      child: ImageIcon(
                                        AssetImage('assets/telebirr.png'),
                                        size: 200,
                                      )),
                                ),
                                Expanded(
                                  child: Container(
                                    color: Colors.pink,
                                    child: SizedBox.expand(
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Donate Through Tele Birr",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Container(
                                                width: 120,
                                                child: RaisedButton(
                                                  color: Colors.white,
                                                  child: Text('Okay',
                                                      style: TextStyle(
                                                        color: Colors.pink,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      )),
                                                  onPressed: () => {
                                                    Navigator.of(context).pop()
                                                  },
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Center(
                      child: Text(
                        "Donate",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DiscoverWidgetVerified extends StatefulWidget {
  DiscoverWidgetVerified(
      {this.profile_name,
      this.profile_image,
      this.city,
      this.country,
      this.moneyToBeRaised,
      this.raisedMoney,
      this.description,
      this.title,
      this.image,
      this.name});

  String profile_name;
  String profile_image;
  String city;
  String country;
  String description;
  String title;
  double raisedMoney;
  double moneyToBeRaised;
  ImageProvider image;
  String name;

  @override
  _DiscoverWidgetVerifiedState createState() => _DiscoverWidgetVerifiedState();
}

class _DiscoverWidgetVerifiedState extends State<DiscoverWidgetVerified> {
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    double progressValue =
        (widget.raisedMoney * 100 / widget.moneyToBeRaised) / 100;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 10, blurRadius: 10)
          ],
          // border: Border.all(color: Colors.white),
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(15)),
      width: MediaQuery.of(context).size.width * 0.99,
      // height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            child: Row(
              children: <Widget>[
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10))
                      ],
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            widget.profile_image,
                          ))),
                ),
                SizedBox(width: 10),
                Row(
                  children: [
                    Text(
                      widget.profile_name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.verified,
                      color: Colors.blue,
                    ),
                  ],
                ),
                SizedBox(width: 10),
                SizedBox(width: 40),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                    alignment: Alignment.center,
                    type: PageTransitionType.rightToLeft,
                    child: DiscoverDetailVerified(
                      name: widget.name,
                      description: widget.description,
                      title: widget.title,
                      image: widget.image,
                    ),
                    inheritTheme: true,
                    ctx: context),
              );
            },
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Hero(
                          tag: 'pictureVerfied',
                          child: Image(
                            image: widget.image,
                            width: MediaQuery.of(context).size.width * 0.99,
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height * 0.45,
                          ),
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.topLeft,
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //         color: Theme.of(context).cardColor,
                    //         borderRadius: BorderRadius.only(
                    //           topRight: Radius.circular(10),
                    //           bottomRight: Radius.circular(10),
                    //         )),
                    //     margin: EdgeInsets.only(top: 20),
                    //     padding:
                    //         EdgeInsets.symmetric(horizontal: 36, vertical: 5),
                    //     child: Icon(
                    //       Icons.verified,
                    //       color: Colors.blue,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        //  borderRadius: BorderRadius.circular(5)
                      ),
                      margin: EdgeInsets.only(top: 4),
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                      child: Text(
                        "Tikur anbesa",
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: "Poppins",
                            color: Colors.white),
                      )),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.city + ", " + widget.country,
                              style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: "Poppins",
                                  color: Theme.of(context).primaryColor),
                            ),
                            Text(
                              "12" + " days ago",
                              style: TextStyle(
                                fontSize: 11,
                                fontFamily: "Poppins",
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          widget.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              fontFamily: "Poppins"),
                        ),
                        SizedBox(
                          height: 13.5,
                        ),
                        Text(
                          widget.description,
                          style: TextStyle(fontSize: 11, fontFamily: "Poppins"),
                          maxLines: 3,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.012,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context)
                                      .cardColor
                                      .withOpacity(0.7),
                                  width: 0.5),
                              borderRadius: BorderRadius.circular(15)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LinearProgressIndicator(
                              value: progressValue,
                              backgroundColor: Colors.white,
                              valueColor: AlwaysStoppedAnimation(
                                  Theme.of(context).cardColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.raisedMoney.toString().replaceAllMapped(
                                      new RegExp(
                                          r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                      (Match m) => '${m[1]},') +
                                  " Etb",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12,
                                  fontFamily: "Poppins"),
                            ),
                            Text(" of"),
                            Text(
                              widget.moneyToBeRaised
                                      .toString()
                                      .replaceAllMapped(
                                          new RegExp(
                                              r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                          (Match m) => '${m[1]},') +
                                  " Etb",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  fontFamily: "Poppins"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          child: Container(
                            color: isDarkMode ? Colors.white : Colors.white,
                            height: 200,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                      color: isDarkMode ? Colors.blue : null,
                                      // color: Colors.blue,
                                      child: ImageIcon(
                                        AssetImage('assets/telebirr.png'),
                                        size: 200,
                                      )),
                                ),
                                Expanded(
                                  child: Container(
                                    color: Colors.pink,
                                    child: SizedBox.expand(
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Donate Through Tele Birr",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Container(
                                                width: 120,
                                                child: RaisedButton(
                                                  color: Colors.white,
                                                  child: Text('Okay',
                                                      style: TextStyle(
                                                        color: Colors.pink,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      )),
                                                  onPressed: () => {
                                                    Navigator.of(context).pop()
                                                  },
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Center(
                      child: Text(
                        "Donate",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
