import 'package:flutter/material.dart';
import 'package:sign_ups/Components/rounded_input_field.dart';

final TextEditingController birthdayController = TextEditingController();

class BirthdayPicker extends StatefulWidget {
  const BirthdayPicker({Key? key}) : super(key: key);

  @override
  _BirthdayPickerState createState() => _BirthdayPickerState();
}

class _BirthdayPickerState extends State<BirthdayPicker> {
  String date = "";
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RoundedInputField(
            controller: birthdayController,
            hintText: "Tap to Select Birthday",
            onChanged: (value) {},
            showCursor: true,
            readOnly: true,
            onTap: () {
              _selectDate(context);
            },
            icon: Icons.cake,
          ),
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    var selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1980),
      lastDate: DateTime(2023),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
        birthdayController.text =
            "${selectedDate.month}/${selectedDate.day}/${selectedDate.year}";
      });
  }
}
