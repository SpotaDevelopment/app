import 'package:flutter/material.dart';

import '../constants.dart';

class SelectLeague extends StatelessWidget {
  final bool isFirstLeague;
  final double index;
  final Icon icon;
  final String league;
  const SelectLeague({
    Key? key,
    required this.isFirstLeague,
    required this.icon,
    required this.league,
    this.index = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (isFirstLeague) {
      return Container(
        height: size.height * 0.065,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 2,
              color: Colors.black,
            ),
            bottom: BorderSide(
              width: 2,
              color: Colors.black,
            ),
          ),
          color: lightGrey,
        ),
        child: Row(
          children: [
            SizedBox(width: size.width * 0.03),
            icon,
            SizedBox(width: size.width * 0.03),
            Text(
              league,
              style: TextStyle(
                  fontFamily: "Oxanium",
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  letterSpacing: 1.25),
            ),
            Spacer(),
            Icon(
              Icons.add_circle_outline,
            ),
            SizedBox(width: size.width * 0.05),
          ],
        ),
      );
    } else {
      return Positioned(
        child: Container(
          height: size.height * 0.065,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 2,
                color: Colors.black,
              ),
              bottom: BorderSide(
                width: 2,
                color: Colors.black,
              ),
            ),
            color: lightGrey,
          ),
          child: Row(
            children: [
              SizedBox(width: size.width * 0.03),
              icon,
              SizedBox(width: size.width * 0.03),
              Text(
                league,
                style: TextStyle(
                    fontFamily: "Oxanium",
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    letterSpacing: 1.25),
              ),
              Spacer(),
              Icon(
                Icons.add_circle_outline,
              ),
              SizedBox(width: size.width * 0.05),
            ],
          ),
        ),
        right: 0,
        left: 0,
        bottom: -47 * index,
      );
    }
  }
}
