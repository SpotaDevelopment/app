import 'package:flutter/material.dart';
import 'package:sign_ups/Components/text_field_container.dart';
import 'package:sign_ups/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            // color: secondaryColor, //TODO: Change this icon color
          ),
          suffixIcon: Icon(
            Icons.visibility,
            // color: secondaryColor //TODO: Change this icon color
          ),
          hintText: "Your Password",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
