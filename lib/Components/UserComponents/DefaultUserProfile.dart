import 'package:flutter/material.dart';

class DefaultUserProfile extends StatelessWidget {
  final String initials;
  final Color color;
  final double radius;

  const DefaultUserProfile({
    Key? key,
    required this.initials,
    required this.color,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: this.radius,
      backgroundColor: color,
      child: Text(
        this.initials,
        style: TextStyle(
          fontSize: this.radius,
          fontFamily: "Oxanium",
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
