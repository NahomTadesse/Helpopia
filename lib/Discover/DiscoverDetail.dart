import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mike/Discover/Picture.dart';
import 'package:mike/Discover/Comments.dart';

class DiscoverDetail extends StatefulWidget {
//
  DiscoverDetail({this.title, this.description, this.image, this.name});

  String title;
  String description;
  ImageProvider image;
  String name;

  @override
  _DiscoverDetailState createState() => _DiscoverDetailState();
}

class _DiscoverDetailState extends State<DiscoverDetail> {
  String ShowMoreText = "Show more";
  String ShowMore = "Show more";
  String ShowLess = "Show Less";
  bool innerBoxIsScrolled = true;
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    var myMenuItems = <String>[
      'Report',
      // 'Profile',
      // 'Setting',
    ];

    void onSelect(item) {
      switch (item) {
        case 'Report':
          print('Home clicked');
          break;
      }

      //   // case 'Profile':
      //   //   print('Profile clicked');
      //   //   break;
      //   // case 'Setting':
      //   //   print('Setting clicked');

      // }
    }

    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              actions: <Widget>[
                PopupMenuButton(
                    tooltip: "Report",
                    padding: EdgeInsets.zero,
                    onSelected: (value) {
                      setState(() {});
                    },
                    color: Colors.white,
                    // splashRadius: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    itemBuilder: (context) => <PopupMenuEntry>[
                          PopupMenuItem(
                            value: 'Spam or Unwanted Content',
                            child: ListTile(
                              leading: const Icon(Icons.dangerous,
                                  color: Colors.red),
                              title: Text(
                                "Spam or Unwanted Content",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          PopupMenuDivider(
                            height: 1,
                          ),
                          PopupMenuItem(
                            value: 'Fraud or Phishing',
                            child: ListTile(
                              leading: const Icon(Icons.dangerous,
                                  color: Colors.red),
                              title: Text(
                                "Fraud or Phishing",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          PopupMenuDivider(
                            height: 1,
                          ),
                          PopupMenuItem(
                            value: 'Harrasment and Hateful Content',
                            child: ListTile(
                              leading: const Icon(Icons.dangerous,
                                  color: Colors.red),
                              title: Text(
                                "Harrasment and Hateful Content",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ]),
              ],
              // floating: true,
              //snap: true,
              // pinned: true,
              expandedHeight: MediaQuery.of(context).size.height * 0.4,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: widget.image,
                        //  width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      gradient: LinearGradient(
                          begin: FractionalOffset.center,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.0),
                            Colors.black.withOpacity(0.0),
                            Colors.black
                          ],
                          stops: [
                            0.0,
                            0.1,
                            1,
                          ])),
                ),
                title: Text(
                  widget.name,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: 16.5),
                ),
              ),
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ];
        },
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              // color: Colors.white,
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          //color: Colors.white,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(15))),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(
                                  color: Colors.black26,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  widget.title,
                                  //textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 18,
                                      fontFamily: "Poppins"),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  widget.description +
                                      widget.description +
                                      widget.description,
                                  maxLines: ShowMoreText == ShowMore
                                      ? 5
                                      : widget.description.length,
                                  style: TextStyle(
                                      fontSize: 12, fontFamily: "Poppins"),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (ShowMoreText == ShowMore) {
                                        ShowMoreText = ShowLess;
                                        print(ShowMoreText);
                                      } else if (ShowMoreText == ShowLess) {
                                        ShowMoreText = ShowMore;
                                        print(ShowMoreText);
                                      }
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 18.0),
                                    child: Text(
                                      ShowMoreText,
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  color: Colors.black26,
                                ),
                              ]))),
                  Divider(),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(15)),
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
                                        // color: Colors.blue,
                                        color: isDarkMode ? Colors.blue : null,
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
                                                      Navigator.of(context)
                                                          .pop()
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
                  Row(children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width * 0.18,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(15)),
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
                                          // color: Colors.blue,
                                          color:
                                              isDarkMode ? Colors.blue : null,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                        Navigator.of(context)
                                                            .pop()
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
                            "50",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width * 0.18,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(15)),
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
                                          // color: Colors.blue,
                                          color:
                                              isDarkMode ? Colors.blue : null,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                        Navigator.of(context)
                                                            .pop()
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
                            "100",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width * 0.18,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(15)),
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
                                          // color: Colors.blue,
                                          color:
                                              isDarkMode ? Colors.blue : null,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                        Navigator.of(context)
                                                            .pop()
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
                            "150",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width * 0.18,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(15)),
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
                                          // color: Colors.blue,
                                          color:
                                              isDarkMode ? Colors.blue : null,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                        Navigator.of(context)
                                                            .pop()
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
                            "200",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                  ]),
                  SizedBox(height: 30),
                  Container(
                    // width: 300,
                    // color: Colors.pink,
                    child: Text(
                      "Donators",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: isDarkMode ? Colors.white : Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      buildList(
                          context,
                          "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                          "Selam Kebde",
                          '3000 Birr'),
                      SizedBox(height: 5),
                      buildList(
                          context,
                          "data:image/jpeg;base64,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",
                          "Hiwot Alemu",
                          '250 Birr'),
                      SizedBox(height: 5),
                      buildList(
                          context,
                          "data:image/jpeg;base64,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",
                          "Abeba Tilahun",
                          '120 Birr'),
                      SizedBox(height: 5),
                      buildList(
                          context,
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6SKReD0y8g1ebDIIvKurmEKaEvPvYNLYK2Q&usqp=CAU",
                          "Mikiyas Ermias",
                          '200 Birr'),
                      SizedBox(height: 5),
                      buildList(
                          context,
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ07zeNZT1JSS65hoqELUx5vv8ixiSPHar3pg&usqp=CAU",
                          "Habtamu alemayehu",
                          '400 Birr'),
                    ],
                  ),
                  Container(
                      decoration: BoxDecoration(
                          //  color: Colors.white,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(15))),
                      child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Comments()));
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "Comments",
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16,
                                            //letterSpacing: 3,
                                            color: Colors.blue,
                                            // fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Icon(Icons.comment, color: Colors.pink),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ]),
                          ))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildList(BuildContext context, String img, String donator_name,
          String amount) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
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
                            img,
                          ))),
                ),
                // SizedBox(width: 10),
                Column(
                  children: [
                    Text(
                      donator_name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            // SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  amount,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.pink),
                ),
              ],
            ),
            // SizedBox(width: 40),
          ],
        ),
      );
  Widget buildCommentList(
          BuildContext context, String img, String Username, String Comment) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
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
                            img,
                          ))),
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  // margin: EdgeInsets.symmetric(horizontal: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Username,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        Comment,
                        style: TextStyle(
                            fontSize: 16, height: 1.4, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // SizedBox(width: 10),

            // SizedBox(width: 40),
          ],
        ),
      );
}

class DiscoverDetailVerified extends StatefulWidget {
  DiscoverDetailVerified({this.title, this.description, this.image, this.name});

  String title;
  String description;
  ImageProvider image;
  String name;

  @override
  _DiscoverDetailVerifiedState createState() => _DiscoverDetailVerifiedState();
}

class _DiscoverDetailVerifiedState extends State<DiscoverDetailVerified> {
  String ShowMoreText = "Show more";
  String ShowMore = "Show more";
  String ShowLess = "Show Less";

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    var myMenuItems = <String>[
      'Report',
      // 'Profile',
      // 'Setting',
    ];

    void onSelect(item) {
      switch (item) {
        case 'Report':
          print('Home clicked');
          break;
        // case 'Profile':
        //   print('Profile clicked');
        //   break;
        // case 'Setting':
        //   print('Setting clicked');
        //   break;
      }
    }

    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              actions: <Widget>[
                PopupMenuButton(
                    tooltip: "Report",
                    padding: EdgeInsets.zero,
                    onSelected: (value) {
                      setState(() {});
                    },
                    color: Colors.white,
                    // splashRadius: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    itemBuilder: (context) => <PopupMenuEntry>[
                          PopupMenuItem(
                            value: 'Spam or Unwanted Content',
                            child: ListTile(
                              leading: const Icon(Icons.dangerous,
                                  color: Colors.red),
                              title: Text(
                                "Spam or Unwanted Content",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          PopupMenuDivider(
                            height: 1,
                          ),
                          PopupMenuItem(
                            value: 'Fraud or Phishing',
                            child: ListTile(
                              leading: const Icon(Icons.dangerous,
                                  color: Colors.red),
                              title: Text(
                                "Fraud or Phishing",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          PopupMenuDivider(
                            height: 1,
                          ),
                          PopupMenuItem(
                            value: 'Harrasment and Hateful Content',
                            child: ListTile(
                              leading: const Icon(Icons.dangerous,
                                  color: Colors.red),
                              title: Text(
                                "Harrasment and Hateful Content",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ]),
              ],
              // floating: true,
              //snap: true,
              // pinned: true,
              expandedHeight: MediaQuery.of(context).size.height * 0.4,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: widget.image,
                        //  width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      gradient: LinearGradient(
                          begin: FractionalOffset.center,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.0),
                            Colors.black.withOpacity(0.0),
                            Colors.black
                          ],
                          stops: [
                            0.0,
                            0.1,
                            1,
                          ])),
                ),
                title: Text(
                  widget.name,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: 16.5),
                ),
              ),
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ];
        },
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              // color: Colors.white,
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          //color: Colors.white,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(15))),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(
                                  color: Colors.black26,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  widget.title,
                                  //textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 18,
                                      fontFamily: "Poppins"),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  widget.description +
                                      widget.description +
                                      widget.description,
                                  maxLines: ShowMoreText == ShowMore
                                      ? 5
                                      : widget.description.length,
                                  style: TextStyle(
                                      fontSize: 12, fontFamily: "Poppins"),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (ShowMoreText == ShowMore) {
                                        ShowMoreText = ShowLess;
                                        print(ShowMoreText);
                                      } else if (ShowMoreText == ShowLess) {
                                        ShowMoreText = ShowMore;
                                        print(ShowMoreText);
                                      }
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 18.0),
                                    child: Text(
                                      ShowMoreText,
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  color: Colors.black26,
                                ),
                              ]))),
                  Divider(),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(15)),
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
                                                "Pay Through Tele Birr",
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
                                                      Navigator.of(context)
                                                          .pop()
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
                  Row(children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width * 0.18,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(15)),
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
                                          // color: Colors.blue,
                                          color:
                                              isDarkMode ? Colors.blue : null,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                        Navigator.of(context)
                                                            .pop()
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
                            "50",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width * 0.18,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(15)),
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
                                          // color: Colors.blue,
                                          color:
                                              isDarkMode ? Colors.blue : null,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                        Navigator.of(context)
                                                            .pop()
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
                            "100",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width * 0.18,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(15)),
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
                                          // color: Colors.blue,
                                          color:
                                              isDarkMode ? Colors.blue : null,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                        Navigator.of(context)
                                                            .pop()
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
                            "150",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width * 0.18,
                      decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(15)),
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
                                          // color: Colors.blue,
                                          color:
                                              isDarkMode ? Colors.blue : null,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                        Navigator.of(context)
                                                            .pop()
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
                            "200",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                  ]),
                  SizedBox(height: 30),
                  SizedBox(height: 30),
                  Container(
                    // width: 300,
                    // color: Colors.pink,
                    child: Text(
                      "Donators",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: isDarkMode ? Colors.white : Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      buildList(
                          context,
                          "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                          "Selam Kebde",
                          '3000 Birr'),
                      SizedBox(height: 5),
                      buildList(
                          context,
                          "data:image/jpeg;base64,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",
                          "Hiwot Alemu",
                          '250 Birr'),
                      SizedBox(height: 5),
                      buildList(
                          context,
                          "data:image/jpeg;base64,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",
                          "Abeba Tilahun",
                          '120 Birr'),
                      SizedBox(height: 5),
                      buildList(
                          context,
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6SKReD0y8g1ebDIIvKurmEKaEvPvYNLYK2Q&usqp=CAU",
                          "Mikiyas Ermias",
                          '200 Birr'),
                      SizedBox(height: 5),
                      buildList(
                          context,
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ07zeNZT1JSS65hoqELUx5vv8ixiSPHar3pg&usqp=CAU",
                          "Habtamu alemayehu",
                          '400 Birr'),
                    ],
                  ),
                  Container(
                      decoration: BoxDecoration(
                          //  color: Colors.white,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(15))),
                      child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Comments()));
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          "Comments",
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 16,
                                            //letterSpacing: 3,
                                            color: Colors.blue,
                                            // fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        Icon(Icons.comment, color: Colors.pink),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ]),
                          ))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildList(BuildContext context, String img, String donator_name,
          String amount) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
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
                            img,
                          ))),
                ),
                // SizedBox(width: 10),
                Column(
                  children: [
                    Text(
                      donator_name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            // SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  amount,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.pink),
                ),
              ],
            ),
            // SizedBox(width: 40),
          ],
        ),
      );

  Widget buildCommentList(
          BuildContext context, String img, String Username, String Comment) =>
      MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
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
                            img,
                          ))),
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  // margin: EdgeInsets.symmetric(horizontal: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Username,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        Comment,
                        style: TextStyle(
                            fontSize: 16, height: 1.4, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // SizedBox(width: 10),

            // SizedBox(width: 40),
          ],
        ),
      );
}
//  body: SafeArea(
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Container(
//             // color: Colors.white,
//             child: Column(
//               children: [
//                 Container(
//                   height: MediaQuery.of(context).size.height * 0.5,
//                   width: MediaQuery.of(context).size.width,
//                   child: Hero(
//                       tag: "picture",
//                       child: Image(
//                         image: widget.image,
//                         width: MediaQuery.of(context).size.width,
//                         fit: BoxFit.cover,
//                       )),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(left: 8.0, top: 18, bottom: 10),
//                   child: Row(
//                     children: [
//                       Align(
//                         alignment: Alignment.center,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(70),
//                           child: Image(
//                             fit: BoxFit.cover,
//                             image: widget.image,
//                             height: MediaQuery.of(context).size.height * 0.06,
//                             width: MediaQuery.of(context).size.height * 0.06,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           widget.name,
//                           style: TextStyle(
//                               fontFamily: "Poppins",
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16.5),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                     decoration: BoxDecoration(
//                         //color: Colors.white,
//                         borderRadius:
//                             BorderRadius.only(topLeft: Radius.circular(15))),
//                     child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                         child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Divider(
//                                 color: Colors.black26,
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Text(
//                                 widget.title,
//                                 //textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w900,
//                                     fontSize: 18,
//                                     fontFamily: "Poppins"),
//                               ),
//                               SizedBox(
//                                 height: 15,
//                               ),
//                               Text(
//                                 widget.description +
//                                     widget.description +
//                                     widget.description,
//                                 maxLines: ShowMoreText == ShowMore
//                                     ? 5
//                                     : widget.description.length,
//                                 style: TextStyle(
//                                     fontSize: 12, fontFamily: "Poppins"),
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     if (ShowMoreText == ShowMore) {
//                                       ShowMoreText = ShowLess;
//                                       print(ShowMoreText);
//                                     } else if (ShowMoreText == ShowLess) {
//                                       ShowMoreText = ShowMore;
//                                       print(ShowMoreText);
//                                     }
//                                   });
//                                 },
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(top: 18.0),
//                                   child: Text(
//                                     ShowMoreText,
//                                     style: TextStyle(color: Colors.blue),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Divider(
//                                 color: Colors.black26,
//                               ),
//                             ]))),
//                 Container(
//                     decoration: BoxDecoration(
//                         //  color: Colors.white,
//                         borderRadius:
//                             BorderRadius.only(topLeft: Radius.circular(15))),
//                     child: Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: Align(
//                           alignment: Alignment.topLeft,
//                           child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Message",
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.w900,
//                                       fontFamily: "Poppins",
//                                       fontSize: 16),
//                                 ),
//                                 SizedBox(
//                                   height: 15,
//                                 ),
//                                 Text(
//                                   "Thank you very much for the donationThank you very much for the donationThank you very much for the donationThank you very much for the donationThank you very much for the donationThank you very much for the donation",
//                                   style: TextStyle(
//                                       fontFamily: "Poppins", fontSize: 12),
//                                 ),
//                               ]),
//                         ))),
//                 Divider(),
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   margin: EdgeInsets.all(10.0),
//                   width: MediaQuery.of(context).size.width * 0.3,
//                   decoration: BoxDecoration(
//                       color: Color.fromRGBO(15, 15, 190, 1),
//                       borderRadius: BorderRadius.circular(15)),
//                   child: Center(
//                     child: Text(
//                       "Donate",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 17,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
