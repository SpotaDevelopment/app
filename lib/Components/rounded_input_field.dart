import 'package:flutter/material.dart';
import 'package:sign_ups/Components/text_field_container.dart';
import 'package:sign_ups/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person, //TODO: Change this icon?
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            // color: secondaryColor, //TODO: Change this icon color
          ),
          hintText: "Your Username",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
