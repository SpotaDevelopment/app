import 'package:flutter/material.dart';

class NewsArticleWithImage extends StatelessWidget {
  final String title, date, source, newsImage, image, url;
  //final Image image;
  final VoidCallback pressed;

  const NewsArticleWithImage({
    Key? key,
    this.title = "",
    this.date = "",
    this.source = "",
    this.newsImage = "",
    this.image = "",
    this.url = "",
    //AssetImage("assets/images/SpotaLogo.jpeg")
    required this.pressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: InkWell(
          //added inkwell to add onTap functionality
          onTap: pressed,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.white, width: 16.0),
                        right: BorderSide(color: Colors.white, width: 16.0),
                        left: BorderSide(color: Colors.white, width: 16.0),
                      ),
                      image: imagePicker(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          date,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                        ),
                        Spacer(),
                        Text(
                          source,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  DecorationImage imagePicker() {
    if (image == "") {
      return DecorationImage(
        image: AssetImage("assets/images/SpotaLogo.jpeg"),
        fit: BoxFit.fill,
      );
    } else {
      return DecorationImage(
        image: NetworkImage(image),
        fit: BoxFit.fill,
      );
    }
  }
}
