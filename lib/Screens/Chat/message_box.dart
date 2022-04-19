import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Components/rounded_input_field.dart';

class MessageBox extends StatelessWidget {
  final String message;

  const MessageBox({
    Key? key,
    this.message = "",
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 64,
      decoration: BoxDecoration(
        color: Colors.black12,
        border: Border(
          top: BorderSide(width: 1.0, color: Colors.blueGrey),
        ),
      ),
      //add bar between each chat room
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              iconSize: 40,
              icon: Icon(Icons.add),
              color: Colors.black45,
              onPressed: () {},
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              width: size.width * 0.69,
              child: TextField(   //TODO: Fix this to make it nice bc idk how yall did it before
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    border: OutlineInputBorder(),
                    labelText: 'Message',
                  ),
              ),
            ),
            IconButton(
              iconSize: 28,
              icon: Icon(Icons.send),
              color: Colors.black45,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
