import 'package:flutter/material.dart';
import 'package:sign_ups/constants.dart';

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
          label: '',
          activeIcon: Icon(Icons.newspaper, color: Colors.black, size: 36),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.scoreboard, color: Colors.black, size: 32),
          backgroundColor: Colors.white,
          label: '',
          activeIcon: Icon(Icons.scoreboard, color: Colors.black, size: 36),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.black, size: 32),
          backgroundColor: Colors.white,
          label: '',
          activeIcon: Icon(Icons.home, color: Colors.black, size: 36),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat, color: Colors.black, size: 32),
          backgroundColor: Colors.white,
          label: '',
          activeIcon: Icon(Icons.chat, color: Colors.black, size: 36),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Colors.black, size: 32),
          backgroundColor: Colors.white,
          label: '',
          activeIcon: Icon(Icons.person, color: Colors.black, size: 36),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }
}
