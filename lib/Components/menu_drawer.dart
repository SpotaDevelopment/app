import 'package:flutter/material.dart';
import 'package:sign_ups/Screens/FavoritePosts/favoritePosts_screen.dart';
import 'package:sign_ups/Screens/Groups/groups_screen.dart';
import 'package:sign_ups/Screens/Settings/settings_screen.dart';
import '../Screens/FindFriendsPage/find_friends_screen.dart';
import '/constants/all_constants.dart';
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
          //ListView.Seperated? to include Dividers
          padding: padding,
          children: <Widget>[
            Container(
              height: 120.0,
              child: DrawerHeader(
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                decoration: BoxDecoration(color: primaryColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Menu',
                        style: TextStyle(fontSize: 30, color: Colors.white)),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon:
                          const Icon(Icons.menu, color: Colors.white, size: 36),
                    )
                  ],
                ),
              ),
            ),
            Divider(color: Colors.white),
            const SizedBox(
              height: 5,
            ),
            buildMenuItem(
              text: 'Notifications',
              icon: Icons.notifications,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(
              height: 5,
            ),
            Divider(color: Colors.white),
            const SizedBox(
              height: 5,
            ),
            buildMenuItem(
                text: 'Groups',
                icon: Icons.group,
                onClicked: () => selectedItem(context, 1)),
            const SizedBox(
              height: 5,
            ),
            Divider(color: Colors.white),
            const SizedBox(
              height: 5,
            ),
            buildMenuItem(
                text: 'Favorite Posts',
                icon: Icons.favorite,
                onClicked: () => selectedItem(context, 2)),
            const SizedBox(
              height: 5,
            ),
            Divider(color: Colors.white),
            const SizedBox(
              height: 5,
            ),
            buildMenuItem(
                text: 'Find Friends',
                icon: Icons.search,
                onClicked: () => selectedItem(context, 3)),
            const SizedBox(
              height: 5,
            ),
            Divider(color: Colors.white),
            const SizedBox(
              height: 5,
            ),
            buildMenuItem(
                text: 'Settings',
                icon: Icons.settings,
                onClicked: () => selectedItem(context, 4)),
            const SizedBox(
              height: 5,
            ),
            Divider(color: Colors.white),
            const SizedBox(
              height: 5,
            ),
            buildMenuItem(
                text: 'Sign Out',
                icon: Icons.person,
                onClicked: () => selectedItem(context, 5)),
            const SizedBox(
              height: 5,
            ),
            Divider(color: Colors.white),
            const SizedBox(
              height: 5,
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
    List<Widget> screens = [
      NotificationsScreen(),
      GroupsScreen(),
      FavoritePostsScreen(),
      FindFriendsScreen(),
      const SettingsScreen(),
    ];
    switch (index) {
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => screens[index],
        ));
        break;
      case 5:
        AuthenticationService().signOut().then((_) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const WelcomeScreen())));
        break;
      default:
        break;
    }
  }
}
