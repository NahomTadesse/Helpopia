import 'package:flutter/material.dart';

class CampaignCards extends StatefulWidget {
  CampaignCards({
    this.title,
    this.raisedmoney,
    this.moneytoberaised,
    this.status,
  });

  String title;
  double raisedmoney;
  double moneytoberaised;
  String status;

  @override
  _CampaignCardsState createState() => _CampaignCardsState();
}

class _CampaignCardsState extends State<CampaignCards> {
  String mStatus;
  @override
  void initState() {
    mStatus = widget.status;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double progressValue =
        (widget.raisedmoney * 100 / widget.moneytoberaised) / 100;

    Widget open = Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        'Open',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 11,
          fontFamily: "Poppins",
          color: Colors.white,
        ),
      ),
    );
    Widget closed = Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        'Closed',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 11,
          fontFamily: "Poppins",
          color: Colors.black,
        ),
      ),
    );
    Widget cancelled = Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        'Cancelled',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 11,
          fontFamily: "Poppins",
          color: Colors.white,
        ),
      ),
    );
    var currentsStatus = {
      'Open': open,
      'Closed': closed,
      'Cancelled': cancelled
    };
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 10, blurRadius: 10)
          ],
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(6)),
      width: MediaQuery.of(context).size.width * 0.99,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
            ),
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                currentsStatus[mStatus],
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          fontFamily: "Poppins"),
                    ),
                    PopupMenuButton(
                        padding: EdgeInsets.zero,
                        onSelected: (value) {
                          setState(() {
                            mStatus = value;
                          });
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
                                value: 'Open',
                                child: ListTile(
                                  leading: const Icon(Icons.lock_open,
                                      color: Colors.green),
                                  title: Text(
                                    "Open",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                value: 'Closed',
                                child: ListTile(
                                  leading: const Icon(Icons.lock_outline,
                                      color: Colors.yellow),
                                  title: Text(
                                    "Close",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                              PopupMenuItem(
                                value: 'Cancelled',
                                child: ListTile(
                                  leading: const Icon(Icons.cancel,
                                      color: Colors.red),
                                  title: Text(
                                    "Cancel",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ]),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.012,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).cardColor.withOpacity(0.7),
                          width: 0.5),
                      borderRadius: BorderRadius.circular(15)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: progressValue,
                      backgroundColor: Colors.white,
                      valueColor:
                          AlwaysStoppedAnimation(Theme.of(context).cardColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                  width: 13,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.raisedmoney.toString().replaceAllMapped(
                              new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                              (Match m) => '${m[1]},') +
                          " Etb",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                          fontFamily: "Poppins"),
                    ),
                    Text(" of"),
                    Text(
                      widget.moneytoberaised.toString().replaceAllMapped(
                              new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
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
        ],
      ),
    );
  }
}
