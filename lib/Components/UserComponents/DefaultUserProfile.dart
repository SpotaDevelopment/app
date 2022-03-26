import 'package:flutter/material.dart';

class DefaultUserProfile extends StatelessWidget {
  final String initials;
  final Color color;

  const DefaultUserProfile({
    Key? key,
    required this.initials,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 42,
      backgroundColor: color,
      child: Text(
        this.initials,
        style: TextStyle(
          fontSize: 42,
          fontFamily: "Oxanium",
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
