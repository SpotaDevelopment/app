import 'package:flutter/material.dart';

class FutureBasketballScoreCard extends StatelessWidget {
  final String homeTeam, awayTeam, homeLogo, awayLogo,
      homeRecord, awayRecord, date, time;

  const FutureBasketballScoreCard({
    Key? key,
    this.homeTeam = "",
    this.awayTeam = "",
    this.homeLogo = "",
    this.awayLogo = "",
    this.homeRecord = "",
    this.awayRecord = "",
    this.date = "",
    this.time = ""
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container (
        height: 100,
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
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
                        image: AssetImage("assets/icons/NBA/suns.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(date, style: TextStyle(fontSize: 16)),
                        Text(time, style: TextStyle(fontSize: 12)),
                      ],
                    ),
                    Spacer(),
                    SizedBox(
                      height: 61.5,
                      width: 61.5,
                      child: Image(
                        //child: Image.network(favorite leagues images list[index])
                        image: AssetImage("assets/icons/NBA/heat.png"),
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
            ],
          ),
        ),
      ),
    );
  }
}