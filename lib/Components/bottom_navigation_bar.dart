import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.newspaper, color: Colors.black, size: 32),
          backgroundColor: Colors.white,
          label: 'News',
          activeIcon: Icon(Icons.newspaper, color: Colors.amber, size: 32),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.scoreboard, color: Colors.black, size: 32),
          backgroundColor: Colors.white,
          label: 'Scores',
          activeIcon: Icon(Icons.scoreboard, color: Colors.amber, size: 32),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.black, size: 32),
          backgroundColor: Colors.white,
          label: 'Home',
          activeIcon: Icon(Icons.home, color: Colors.amber, size: 32),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat, color: Colors.black, size: 32),
          backgroundColor: Colors.white,
          label: 'Chat',
          activeIcon: Icon(Icons.chat, color: Colors.amber, size: 32),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Colors.black, size: 32),
          backgroundColor: Colors.white,
          label: 'Profile',
          activeIcon: Icon(Icons.person, color: Colors.amber, size: 32),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }
}
