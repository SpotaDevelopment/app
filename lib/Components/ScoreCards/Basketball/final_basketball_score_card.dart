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
                padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(width: 8),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(awayTeam, style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.bold)),
                        Text(awayRecord, style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    const SizedBox(width: 8),
                    ClipRect(
                      child: Align(
                        heightFactor: 0.075,
                        widthFactor: 0.075,
                        child: Image.asset("assets/images/SpotaLogo.jpeg"),
                        //child: Image.asset(awayLogo),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(awayScore, style: TextStyle(fontSize: 32,
                        fontWeight: FontWeight.bold)),
                    const SizedBox(width: 8),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Final", style: TextStyle(fontSize: 16)),
                        Text(date, style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    const SizedBox(width: 8),
                    Text(homeScore, style: TextStyle(fontSize: 32,
                        fontWeight: FontWeight.bold)),
                    const SizedBox(width: 8),
                    ClipRect(
                      child: Align(
                        heightFactor: 0.075,
                        widthFactor: 0.075,
                        child: Image.asset("assets/images/SpotaLogo.jpeg"),
                        //child: Image.asset(homeLogo),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(homeTeam, style: TextStyle(fontSize: 16,
                            fontWeight: FontWeight.bold)),
                        Text(homeRecord, style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    const SizedBox(width: 8),
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