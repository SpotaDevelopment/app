import 'package:flutter/material.dart';

class NewsArticleWithImage extends StatelessWidget {
  final String title, date, source, newsImage, url;
  //final Image image;
  final VoidCallback pressed;

  const NewsArticleWithImage({
    Key? key,
    this.title = "",
    this.date = "",
    this.source = "",
    this.newsImage = "assets/images/SpotaLogo.jpeg",
    this.url= "",
    //AssetImage("assets/images/SpotaLogo.jpeg")
    required this.pressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom:8.0),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft:
                    Radius.circular(10.0), topRight: Radius.circular(10.0),
                    ),
                    image: DecorationImage(
                      image: AssetImage(newsImage),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(title,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,
                      vertical: 8.0),
                  child: Row(
                    children: <Widget>[
                      Text(date, style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),),
                      Spacer(),
                      Text(source, style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}