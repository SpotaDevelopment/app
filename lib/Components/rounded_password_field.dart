import 'package:flutter/material.dart';
import 'package:sign_ups/Components/text_field_container.dart';
import 'package:sign_ups/auth/validator.dart';


class RoundedPasswordField extends StatefulWidget {
  final TextEditingController controller;
  RoundedPasswordField({Key? key, required this.controller}) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _hideText = true;
  void toggleText() {
    setState(() {
      _hideText = !_hideText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: widget.controller,
        obscureText: _hideText,
        // onChanged: onChanged,
        validator: (value) => Validator.validatePassword(
          //!Does Validator even get used?
          password: value!,
        ),
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            // color: secondaryColor, //TODO: Change this icon color
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.visibility,
              // color: secondaryColor //TODO: Change this icon color
            ),
            onPressed: toggleText,
          ),
          hintText: "Your Password",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
