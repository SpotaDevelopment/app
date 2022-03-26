import 'package:flutter/material.dart';
import 'package:sign_ups/Components/UserComponents/DefaultUserProfile.dart';

class FriendInList extends StatelessWidget {
  final String name;
  final Color color;

  const FriendInList({
    Key? key,
    required this.name,
    required this.color,
  }) : super(key: key);

  String getInitials(String name) {
    String firstInitial = name[0];
    String secondInitial = "";
    for (int i = 0; i < name.length; i++) {
      if (name[i] == ' ') {
        secondInitial = name[i + 1];
        break;
      }
    }
    return firstInitial + secondInitial;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      width: double.infinity,
      child: Row(
        children: [
          DefaultUserProfile(
            initials: getInitials(name),
            color: color,
          ),
          Spacer(),
          Text(
            name,
            style: TextStyle(
              fontFamily: "Oxanium",
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
