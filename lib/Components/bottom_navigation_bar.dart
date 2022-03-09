import 'package:flutter/material.dart';
import 'package:sign_ups/Screens/Home/home_screen.dart';
import 'package:sign_ups/Screens/Login/login_screen.dart';
import 'package:sign_ups/Screens/News/news_screen.dart';
import 'package:sign_ups/Screens/Scores/scores_screen.dart';
import 'package:sign_ups/constants.dart';


int current = 0;
class BottomNavBar extends StatefulWidget {
  final int curIndex;
  const BottomNavBar({Key? key, this.curIndex = 0}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}


class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;
  final screens = [
    const SportsNewsPage(),
    SportsScoresPage(),
    HomeScreen(),
    const LoginScreen(),
    const LoginScreen(),
  ];

  _onTap() {
    Navigator.push(context, PageRouteBuilder(pageBuilder: (_, __, ___) =>
        screens[currentIndex],
        transitionDuration: const Duration(seconds: 0),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: 36,
      currentIndex: currentIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.newspaper_outlined , color: Colors.black),
          label: 'News',
          activeIcon: Icon(Icons.newspaper_sharp, color: Colors.black),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.scoreboard_outlined, color: Colors.black),
          label: 'Scores',
          activeIcon: Icon(Icons.scoreboard, color: Colors.black),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined, color: Colors.black),
          label: 'Home',
          activeIcon: Icon(Icons.home, color: Colors.black),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_outlined, color: Colors.black),
          label: 'Chat',
          activeIcon: Icon(Icons.chat, color: Colors.black),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outlined, color: Colors.black),
          label: 'Profile',
          activeIcon: Icon(Icons.person, color: Colors.black),
        ),
      ],
      onTap: (index) { // this has changed
        setState(() {
          currentIndex = index;
        });
        _onTap();
      }
    );
  }
}
