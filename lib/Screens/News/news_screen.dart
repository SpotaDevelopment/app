import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:sign_ups/Components/leagues_toggle_buttons.dart';
import 'package:sign_ups/Components/news_article_with_image.dart';
import 'package:sign_ups/Components/spota_appbar.dart';

import '../../Components/bottom_navigation_bar.dart';
import '../../Components/menu_drawer.dart';
import '../../Components/news_article_without_image.dart';
import '../../auth/AuthenticationService.dart';
import '../../model/News.dart';

class SportsNewsPage extends StatefulWidget {
  static const String path = 'lib/Screens/News/news_screen.dart';

  const SportsNewsPage({Key? key}) : super(key: key);

  @override
  State<SportsNewsPage> createState() => _SportsNewsPageState();
}

class _SportsNewsPageState extends State<SportsNewsPage> {
  late Future<List<News>> futureNewsPosts;

  @override
  void initState() {
    super.initState();
    futureNewsPosts = AuthenticationService().fetchNewsPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SpotaAppBar(),
      endDrawer: MenuDrawer(),
      body: Container(
        alignment: Alignment.center,
        child: FutureBuilder(
          future: futureNewsPosts,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return RefreshIndicator(
                child: _newsView(snapshot), onRefresh: _pull);
          },
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

  Widget _newsView(AsyncSnapshot snapshot) {
    if (snapshot.hasData) {
      return ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (BuildContext context, int index) {
          var data = snapshot.data[index];
          if (data.image == null ||
              data.image == "" ||
              data.image == "null" ||
              data.image == " ") {
            return NewsArticleWithoutImage(
              title: data.title,
              //date: data.date,
              source: data.source,
              pressed: () {
                launch(data.url);
              },
            );
          } else {
            return NewsArticleWithImage(
              title: data.title,
              //date: data.date,
              image: data.image,
              source: data.source,
              url: data.url,
              pressed: () {
                launch(data.url);
              },
            );
          }
        },
      );
    } else if (snapshot.hasError) {
      return Text('${snapshot.error}');
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  Future<void> _pull() async {
    setState(() {
      futureNewsPosts = AuthenticationService().fetchNewsPosts();
    });
  }
}


/*
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SpotaAppBar(),
      endDrawer: MenuDrawer(),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: LeaguesToggleButtons(),
          ),
          Divider(
            color: Colors.black),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                NewsArticleWithImage(
                  title: "Spota is a sick app baby!",
                  date: "3/7/22 1:32 PM",
                  source: "Basketball",
                  newsImage: "assets/images/suns.jpg",
                  pressed: () {  },
                ),
                NewsArticleWithoutImage(
                  title: "Spota is a dope app baby (even without images)!",
                  date: "3/7/22 1:34 PM",
                  source: "Basketball",
                  pressed: () {  },
                ),
                NewsArticleWithImage(
                  title: "Thank you for scrolling",
                  date: "3/7/22 1:35 PM",
                  source: "Basketball",
                  newsImage: "assets/images/suns.jpg",
                  pressed: () {  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}*/