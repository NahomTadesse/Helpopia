import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting_Cards extends StatefulWidget {
  Setting_Cards({this.text, this.onPressed, this.icon, this.color});

  String text;
  Function onPressed;
  IconData icon;
  Color color;

  @override
  _Setting_CardsState createState() => _Setting_CardsState();
}

class _Setting_CardsState extends State<Setting_Cards> {
  bool nightmode = false;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    bool AccountSettingSubSettings = false;
    return Container(
      margin: EdgeInsets.only(top: 1),
      padding: EdgeInsets.only(right: 9),
      height: MediaQuery.of(context).size.height * 0.062,
      decoration: BoxDecoration(color: Theme.of(context).primaryColorLight),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 17.0),
            child: Icon(widget.icon,
                size: 23.5,
                //  color: Color.fromRGBO(15, 15, 72, 1),
                color: widget.color),
          ),
          Text(
            widget.text,
            style: TextStyle(
                color:
                    isDarkMode ? Colors.white : Color.fromRGBO(15, 15, 72, 1),
                fontWeight: FontWeight.w600,
                fontSize: 15),
          ),
          Spacer(),
          widget.text != "Sign out"
              ? Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 17.0),
                  child: Icon(Icons.arrow_forward_ios_sharp,
                      size: 17.5,
                      color: Theme.of(context).primaryColor.withOpacity(0.2)
                      //  color: Color.fromRGBO(15, 15, 72, 1),

                      ),
                )
              : Container()
        ],
      ),
    );
  }
}
