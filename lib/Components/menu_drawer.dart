import 'package:flutter/material.dart';
import 'package:sign_ups/Screens/FavoritePosts/favoritePosts_screen.dart';
import 'package:sign_ups/Screens/Groups/groups_screen.dart';
import 'package:sign_ups/Screens/Settings/settings_screen.dart';
import 'package:sign_ups/constants.dart';

import '../Screens/Notifications/notifications_screen.dart';
import '../Screens/Welcome/welcome_screen.dart';
import '../auth/AuthenticationService.dart';

class MenuDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: primaryColor,
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            Divider(color: Colors.white),
            const SizedBox(
              height: 10,
            ),
            buildMenuItem(
              text: 'Notifications',
              icon: Icons.notifications,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(color: Colors.white),
            const SizedBox(
              height: 10,
            ),
            buildMenuItem(
                text: 'Settings',
                icon: Icons.settings,
                onClicked: () => selectedItem(context, 1)),
            const SizedBox(
              height: 10,
            ),
            Divider(color: Colors.white),
            const SizedBox(
              height: 10,
            ),
            buildMenuItem(
                text: 'Favorite Posts',
                icon: Icons.favorite,
                onClicked: () => selectedItem(context, 2)),
            const SizedBox(
              height: 10,
            ),
            Divider(color: Colors.white),
            const SizedBox(
              height: 10,
            ),
            buildMenuItem(
                text: 'Groups',
                icon: Icons.group,
                onClicked: () => selectedItem(context, 3)),
            const SizedBox(
              height: 10,
            ),
            Divider(color: Colors.white),
            const SizedBox(
              height: 10,
            ),
            buildMenuItem(
                text: 'Sign Out',
                icon: Icons.person,
                onClicked: () => selectedItem(context, 4)),
            const SizedBox(
              height: 10,
            ),
            Divider(color: Colors.white),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  buildMenuItem({
    required String text,
    required IconData icon,
    required VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(fontSize: 24, color: color)),
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop(); //closes the drawer
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => NotificationsScreen(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const SettingsScreen(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FavoritePostsScreen(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => GroupsScreen(),
        ));
        break;
      case 4:
        AuthenticationService().signOut().then((_) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const WelcomeScreen())));
        break;
      default:
        break;
    }
  }
}
