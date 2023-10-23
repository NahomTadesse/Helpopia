import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:page_transition/page_transition.dart';

import 'Discover/DiscoverDetail.dart';
import 'database.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Database d = Database();
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          Container(
            //color: Colors.blue,
            //padding: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: d.Search,
                    ),
                    Column(
                      children: d.Search.reversed.toList(),
                    )
                  ],
                ),
              ),
            ),
          ),
          FloatingSearchBar(
            shadowColor: isDarkMode
                ? Color.fromRGBO(15, 15, 190, 1).withOpacity(0.4)
                : Color.fromRGBO(15, 15, 190, 1),
            height: MediaQuery.of(context).size.height * 0.05,
            margins: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            borderRadius: BorderRadius.circular(25),
            backgroundColor: Theme.of(context).primaryColorLight,
            hint: 'Search...',
            onQueryChanged: (query) {},
            actions: [
              FloatingSearchBarAction.searchToClear(
                showIfClosed: true,
              ),
            ],
            builder: (context, transition) {
              return Container();
            },
          ),
        ]),
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  SearchWidget(
      {this.city,
      this.country,
      this.moneyToBeRaised,
      this.raisedMoney,
      this.description,
      this.title,
      this.image,
      this.name});

  String city;
  String country;
  String description;
  String title;
  double raisedMoney;
  double moneyToBeRaised;
  ImageProvider image;
  String name;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
              alignment: Alignment.center,
              type: PageTransitionType.rightToLeft,
              child: DiscoverDetail(
                name: name,
                description: description,
                title: title,
                image: image,
              ),
              inheritTheme: true,
              ctx: context),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.48,
        height: MediaQuery.of(context).size.height * 0.27,
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: image,
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(5),
            color: Colors.black12),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                // color: Colors.white,
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
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        letterSpacing: 1,
                        color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        moneyToBeRaised.toString().replaceAllMapped(
                            new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                            (Match m) => '${m[1]},'),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                            color: Colors.white),
                      ),
                      Text(
                        " birr",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: 9,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
