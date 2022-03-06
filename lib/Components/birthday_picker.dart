import 'package:flutter/material.dart';

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
          ElevatedButton(
            onPressed: () {
              _selectDate(context);
            },
            child: Text("Choose Date"),
          ),
          Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}")
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    var selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
      });
  }
}
