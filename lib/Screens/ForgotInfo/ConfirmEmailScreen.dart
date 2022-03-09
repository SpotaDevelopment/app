import 'package:flutter/material.dart';

class ConfirmEmailScreen extends StatelessWidget {
  static String id = 'confirm-email';
  final String message;

  const ConfirmEmailScreen({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            message,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        )),
      ),
    );
  }
}
