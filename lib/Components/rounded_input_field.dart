import 'package:flutter/material.dart';
import 'package:sign_ups/Components/text_field_container.dart';
import 'package:sign_ups/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final onTap;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
    required this.controller,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onTap: onTap,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            // color: secondaryColor, //TODO: Change this icon color
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
