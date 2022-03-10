import 'package:flutter/material.dart';

class LiveBasketballScoreCard extends StatelessWidget {
  final String homeTeam, awayTeam, homeScore, awayScore, homeLogo, awayLogo,
      homeRecord, awayRecord, period, time;

  const LiveBasketballScoreCard({
    Key? key,
    this.homeTeam = "",
    this.awayTeam = "",
    this.homeScore = "",
    this.awayScore = "",
    this.homeLogo = "",
    this.awayLogo = "",
    this.homeRecord = "",
    this.awayRecord = "",
    this.period = "",
    this.time = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
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
                    /*ClipRect(
                      child: Align(
                        heightFactor: 0.075,
                        widthFactor: 0.075,
                        child: Image.asset("assets/icons/NBA/suns.png"),
                        //child: Image.asset(awayLogo),
                      ),
                    ),*/
                    SizedBox(
                      height: 61.5,
                      width: 61.5,
                      child: Image(
                        //child: Image.network(favorite leagues images list[index])
                        image: AssetImage("assets/icons/NBA/bucks.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Spacer(),
                    Text(awayScore, style: TextStyle(fontSize: 32,
                        fontWeight: FontWeight.bold)),
                    const SizedBox(width: 8),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(period, style: TextStyle(fontSize: 16)),
                        Text(time, style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Spacer(),
                    Text(homeScore, style: TextStyle(fontSize: 32,
                        fontWeight: FontWeight.bold)),
                    Spacer(),
                    SizedBox(
                      height: 61.5,
                      width: 61.5,
                      child: Image(
                        //child: Image.network(favorite leagues images list[index])
                        image: AssetImage("assets/icons/NBA/thunder.png"),
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