import 'package:flutter/material.dart';

class NewsArticleWithoutImage extends StatelessWidget {
  final String title, date, source, url;
  final VoidCallback pressed;

  const NewsArticleWithoutImage({
    Key? key,
    this.title = "",
    this.date = "",
    this.source = "",
    this.url = "",
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