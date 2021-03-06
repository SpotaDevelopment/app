import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sign_ups/Components/rounded_button.dart';
import 'package:sign_ups/Screens/FavoritePosts/favoritePosts_screen.dart';
import 'package:sign_ups/Screens/Groups/groups_screen.dart';
import 'package:sign_ups/Screens/Login/login_screen.dart';
import 'package:sign_ups/Screens/Settings/settings_screen.dart';
import '../Screens/FindFriendsPage/find_friends_screen.dart';
import '../model/UserAccount.dart';
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
              onClicked: () => FirebaseAuth.instance.currentUser != null
                  ? selectedItem(context, 0)
                  : showAlertDialog(context),
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
              onClicked: () => FirebaseAuth.instance.currentUser != null
                  ? selectedItem(context, 1)
                  : showAlertDialog(context),
            ),
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
              onClicked: () => FirebaseAuth.instance.currentUser != null
                  ? selectedItem(context, 2)
                  : showAlertDialog(context),
            ),
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
              onClicked: () => FirebaseAuth.instance.currentUser != null
                  ? selectedItem(context, 3)
                  : showAlertDialog(context),
            ),
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
              onClicked: () => FirebaseAuth.instance.currentUser != null
                  ? selectedItem(context, 4)
                  : showAlertDialog(context),
            ),
            const SizedBox(
              height: 5,
            ),
            Divider(color: Colors.white),
            const SizedBox(
              height: 5,
            ),
            buildMenuItem(
              text: FirebaseAuth.instance.currentUser != null
                  ? 'Sign Out'
                  : 'Sign In',
              icon: Icons.person,
              onClicked: () {
                if (FirebaseAuth.instance.currentUser != null) {
                  selectedItem(context, 6);
                  globalUserAccount = null;
                } else {
                  selectedItem(context, 5);
                }
              },
            ),
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
      const LoginScreen()
    ];
    switch (index) {
      case 0:
      case 1:
      case 2:
      case 3:
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => screens[index],
        ));
        break;
      case 6:
        AuthenticationService().signOut().then((_) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const WelcomeScreen())));
        break;
      default:
        break;
    }
  }
}

showAlertDialog(BuildContext context) {
  Future.delayed(
    Duration.zero,
    () {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              "You need an account to access this feature.",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            backgroundColor: primaryColor,
            actions: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundedButton(
                      width: 0.25,
                      text: "Sign In",
                      vertical1: 10,
                      horizontal1: 10,
                      vertical2: 0,
                      horizontal2: 10,
                      fontSize: 12,
                      pressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
                            },
                          ),
                        );
                      },
                    ),
                    RoundedButton(
                      width: 0.25,
                      text: "Close",
                      vertical1: 10,
                      horizontal1: 10,
                      vertical2: 0,
                      horizontal2: 10,
                      fontSize: 12,
                      pressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              )
            ],
          );
        },
      );
    },
  );
}
