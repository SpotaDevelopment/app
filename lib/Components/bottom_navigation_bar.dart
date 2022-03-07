import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget{
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>{
  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    type: BottomNavigationBarType.fixed;
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper,
                color: Colors.black,
                size: 32),
            backgroundColor: Colors.white,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.scoreboard,
                color: Colors.black,
                size: 32),
            backgroundColor: Colors.white,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: Colors.black,
                size: 32),
            backgroundColor: Colors.white,
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat,
                color: Colors.black,
                size: 32),
            backgroundColor: Colors.white,
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,
                  color: Colors.black,
                  size: 32),
              backgroundColor: Colors.white,
              label: ''
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
    );
  }
}
