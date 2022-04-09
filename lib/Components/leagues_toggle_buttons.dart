import 'package:flutter/material.dart';
import '/constants/all_constants.dart';

class LeaguesToggleButtons extends StatefulWidget{
  @override
  State<LeaguesToggleButtons> createState() => _LeaguesToggleButtons();

}

class _LeaguesToggleButtons extends State<LeaguesToggleButtons>{
  List<bool> isSelected = [true, false, false, false, false];

  @override
  Widget build(BuildContext context) => ToggleButtons(
    fillColor: secondaryColor,
    color: secondaryColor,
    selectedColor: Colors.white,
    borderColor: Colors.grey.shade300,
    renderBorder: true,
    highlightColor: secondaryColor,
    isSelected: isSelected,
    children: const <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Text("Trending", style: TextStyle(fontSize: 18),),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Text("NBA", style: TextStyle(fontSize: 18),),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Text("NFL", style: TextStyle(fontSize: 18),),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Text("MLB", style: TextStyle(fontSize: 18),),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Text("NHL", style: TextStyle(fontSize: 18),),
      ),
    ],
    onPressed: (int newIndex){
      setState(() {
        for (int index = 0; index < isSelected.length; index++){
          if (index == newIndex){
            isSelected[index] = true;
          }
          else{
            isSelected[index] = false;
          }
        }
      });
    },
  );
}