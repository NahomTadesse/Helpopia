import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mike/Discover/Picture.dart';

class Comments extends StatefulWidget {
//
  Comments({this.title, this.description, this.image, this.name});

  String title;
  String description;
  ImageProvider image;
  String name;

  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios, color: Colors.pink)),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text("Comments",
              style: TextStyle(
                  color: Colors.pink,
                  decoration: TextDecoration.none,
                  fontFamily: "Poppins",
                  letterSpacing: 3,
                  fontSize: 17,
                  fontWeight: FontWeight.bold)),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                  child: ListView(
                children: <Widget>[
                  SizedBox(height: 20),
                  buildCommentList(
                      context,
                      "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                      "Selam Kebde",
                      'Egzer Yemareh'),
                  Divider(
                    color: Colors.black26,
                  ),
                  buildCommentList(
                      context,
                      "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                      "Selam Kebde",
                      'Yemareh'),
                  Divider(
                    color: Colors.black26,
                  ),
                  // Text("Message3"),
                  // Text("Message4"),
                  // Text("Message5"),
                ],
              )),
              Container(
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    // First child is enter comment text input
                    Expanded(
                      child: TextFormField(
                        autocorrect: false,
                        decoration: new InputDecoration(
                          labelText: "Comment",
                          labelStyle:
                              TextStyle(fontSize: 14.0, color: Colors.black),
                          fillColor: Colors.blue,
                          border: OutlineInputBorder(
                              // borderRadius:
                              //     BorderRadius.all(Radius.zero(5.0)),
                              borderSide:
                                  BorderSide(color: Colors.purpleAccent)),
                        ),
                      ),
                    ),
                    // Second child is button
                    IconButton(
                      icon: Icon(Icons.send),
                      iconSize: 20.0,
                      onPressed: () {},
                    )
                  ])),
            ],
          ),
        ));
  }
}

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
