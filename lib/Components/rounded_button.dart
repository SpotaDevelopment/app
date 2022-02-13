import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback pressed;
  final Color color, textColor;
  const RoundedButton({
    Key? key,
    this.text = "",
    required this.pressed,
    this.color = Colors.white,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10 ,horizontal: 20),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            backgroundColor: color,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          ),
          onPressed: pressed,
          child: Text(
              text,
              style: TextStyle(color: textColor, fontSize : 24)),
        ),
      ),
    );
  }
}
