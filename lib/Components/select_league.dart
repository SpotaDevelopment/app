import 'package:flutter/material.dart';

import '../constants.dart';

class SelectLeague extends StatelessWidget {
  final bool isFirstLeague;
  final double index;
  const SelectLeague({
    Key? key,
    required this.isFirstLeague,
    this.index = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (isFirstLeague) {
      return Container(
        height: size.height * 0.07,
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
        ),
        right: 0,
        left: 0,
        bottom: -47 * index,
      );
    }
  }
}
