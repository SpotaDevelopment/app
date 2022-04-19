import 'package:flutter/material.dart';
import 'package:sign_ups/Components/UserComponents/DefaultUserProfile.dart';

import '../../HelperFunctions/functions.dart';

class FriendInList extends StatelessWidget {
  String? name;
  Color? color;

  FriendInList({
    Key? key,
    this.name,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      width: double.infinity,
      child: Row(
        children: [
          SizedBox(width: size.width * 0.02),
          DefaultUserProfile(
            initials: getInitials(name!),
            color: color!,
            radius: 27,
          ),
          SizedBox(width: size.width * 0.1),
          Text(
            name!,
            style: TextStyle(
              fontFamily: "Oxanium",
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
