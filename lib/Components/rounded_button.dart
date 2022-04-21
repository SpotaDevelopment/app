import 'dart:ffi';

import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback pressed;
  final Color color, textColor;
  final double width;
  final double vertical1;
  final double vertical2;
  final double horizontal1;
  final double horizontal2;
  final double fontSize;
  const RoundedButton({
    Key? key,
    this.text = "",
    required this.pressed,
    this.color = Colors.white,
    this.width = 0.8,
    this.textColor = Colors.black,
    this.vertical1 = 10,
    this.horizontal1 = 20,
    this.vertical2 = 20,
    this.horizontal2 = 40,
    this.fontSize = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin:
          EdgeInsets.symmetric(vertical: vertical1, horizontal: horizontal1),
      width: size.width * width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: color,
            padding: EdgeInsets.symmetric(
                vertical: vertical2, horizontal: horizontal2),
          ),
          onPressed: pressed,
          child: Text(text,
              style: TextStyle(color: textColor, fontSize: fontSize)),
        ),
      ),
    );
  }
}
