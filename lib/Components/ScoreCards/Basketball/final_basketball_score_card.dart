import 'package:flutter/material.dart';

class FinalBasketballScoreCard extends StatelessWidget {
  final String homeTeam, awayTeam, homeScore, awayScore, homeLogo, awayLogo,
  homeRecord, awayRecord, date;

  const FinalBasketballScoreCard({
    Key? key,
    this.homeTeam = "",
    this.awayTeam = "",
    this.homeScore = "",
    this.awayScore = "",
    this.homeLogo = "",
    this.awayLogo = "",
    this.homeRecord = "",
    this.awayRecord = "",
    this.date = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container (
        height: 129,
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(awayTeam, style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.bold)),
                        Text(awayRecord, style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Spacer(),
                    SizedBox(
                      height: 61.5,
                      width: 61.5,
                      child: Image(
                        //child: Image.network(favorite leagues images list[index])
                        image: AssetImage("assets/icons/NBA/warriors.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Spacer(),
                    Text(awayScore, style: TextStyle(fontSize: 24,
                        fontWeight: FontWeight.bold)),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Final", style: TextStyle(fontSize: 16)),
                        Text(date, style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Spacer(),
                    Text(homeScore, style: TextStyle(fontSize: 24,
                        fontWeight: FontWeight.bold)),
                    Spacer(),
                    SizedBox(
                      height: 61.5,
                      width: 61.5,
                      child: Image(
                        //child: Image.network(favorite leagues images list[index])
                        image: AssetImage("assets/icons/NBA/nuggets.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(homeTeam, style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.bold)),
                        Text(homeRecord, style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,16,0,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      width: 182.5,
                      height: 35.5,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(10.0)),
                      ),
                      child: Text("Stats", style:
                          TextStyle(fontSize: 16),
                          textAlign: TextAlign.center),
                    ),
                    const VerticalDivider(
                      width: 1,
                      thickness: 1,
                      color: Colors.black,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 182.5,
                      height: 35.5,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(10.0)),
                      ),
                      child: Text("Highlights", style:
                          TextStyle(fontSize: 16),
                          textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}