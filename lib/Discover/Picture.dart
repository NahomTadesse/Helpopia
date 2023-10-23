import 'package:flutter/material.dart';

class Picture extends StatelessWidget {
  Picture({this.image});

  ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Center(
              child: Hero(
                  tag: "picture",
                  child: Image(
                      image: image,
                      fit:BoxFit.cover,

                    width: MediaQuery.of(context).size.width,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
