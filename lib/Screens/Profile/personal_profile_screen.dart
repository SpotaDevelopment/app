import 'package:flutter/material.dart';
import 'package:sign_ups/Components/leagues_toggle_buttons.dart';
import 'package:sign_ups/Components/news_article_with_image.dart';
import 'package:sign_ups/Components/spota_appbar.dart';
import 'package:sign_ups/constants.dart';
import '../../../Components/bottom_navigation_bar.dart';


class PersonalProfilePage extends StatelessWidget{
  static const String path = 'lib/Screens/Scores/scores_screen.dart';
  PersonalProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const SpotaAppBar(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const CircleAvatar(
              radius: 42,
              backgroundColor: Colors.blue,
              child: Text("KO", style: TextStyle(
                fontSize: 42,
                fontFamily: "Oxanium",
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),)
            ),
          ),
          Text("Kevin O'Brien", style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),),
          const Divider(
            color: Colors.black,
            indent: 30,
            endIndent: 30
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            width: size.width * 0.38,
            height: 36,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xffE3E6EE),
                  //padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                ),
                onPressed: (){},
                child: Text("Edit Profile", style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18)),
              ),
            ),
          ),
          const Divider(
              color: Colors.black,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            width: size.width,
            height: 56,
            child: ClipRRect(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xffE3E6EE),
                  //padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                ),
                onPressed: (){},
                child: Row(
                  children: const <Widget>[
                    Text("Friends: ", style: TextStyle(
                      color: Colors.black,
                      fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                    Text("56", style: TextStyle(
                      color: Colors.black,
                      fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios,
                        color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 0),
            width: size.width,
            height: 56,
            child: ClipRRect(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xffE3E6EE),
                  //padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                ),
                onPressed: (){},
                child: Row(
                  children: const <Widget>[
                    Text("Achievements: ", style: TextStyle(
                        color: Colors.black,
                        fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                    Text("12", style: TextStyle(
                        color: Colors.black,
                        fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: ListView(
                children : <Widget>[
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    width: size.width,
                    height: 150,
                    child: ClipRRect(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          //backgroundColor: const Color(0xffE3E6EE),
                          //padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        ),
                        onPressed: (){},
                        child: Column(
                          children: <Widget>[
                            const Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(top: 8, bottom: 8),
                                child: Text("Favorite Leagues: ", style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Container(
                              height: 100,
                              width: 50,
                              child: const Image(
                                //child: Image.network(favorite leagues images list[index])
                                image: AssetImage("assets/icons/NBA/_NBA_logo.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    width: size.width,
                    height: 150,
                    child: ClipRRect(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          //backgroundColor: const Color(0xffE3E6EE),
                          //padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                        ),
                        onPressed: (){},
                        child: Column(
                          children: <Widget>[
                            const Align(

                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(top: 8, bottom: 8),
                                child: Text("Favorite Teams: ", style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ),
                            Row(
                              children: const [
                                Spacer(),
                                Center(
                                  child: SizedBox(
                                    height: 75,
                                    width: 75,
                                    child: Image(
                                      //child: Image.network(favorite leagues images list[index])
                                      image: AssetImage("assets/icons/NBA/suns.png"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                  height: 75,
                                  width: 75,
                                  child: Image(
                                    //child: Image.network(favorite leagues images list[index])
                                    image: AssetImage("assets/icons/NBA/celtics.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                  height: 75,
                                  width: 75,
                                  child: Image(
                                    //child: Image.network(favorite leagues images list[index])
                                    image: AssetImage("assets/icons/NBA/trailBlazers.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}