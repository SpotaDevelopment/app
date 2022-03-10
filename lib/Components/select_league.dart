import 'package:flutter/material.dart';

import '../constants.dart';

var leagueNames = [
  'NFL Football',
  'NBA Basketball',
  'MLB Baseball',
  'NHL Hockey',
  'NCAA Basketball',
  'NCAA Football',
  'PGA Golf',
  'NASCAR Racing',
  'WNBA Basketball'
];
var iconList = [
  Icon(Icons.sports_football_outlined, color: Colors.black),
  Icon(Icons.sports_basketball_outlined, color: Colors.black),
  Icon(Icons.sports_baseball_outlined, color: Colors.black),
  Icon(Icons.sports_hockey_outlined, color: Colors.black),
  Icon(Icons.sports_basketball_outlined, color: Colors.black),
  Icon(Icons.sports_football_outlined, color: Colors.black),
  Icon(Icons.sports_golf_outlined, color: Colors.black),
  Icon(Icons.directions_car, color: Colors.black),
  Icon(Icons.sports_basketball_outlined, color: Colors.black),
];

class SelectLeagues extends StatefulWidget {
  const SelectLeagues({Key? key}) : super(key: key);

  @override
  State<SelectLeagues> createState() => _SelectLeaguesState();
}

class _SelectLeaguesState extends State<SelectLeagues> {
  var iconToggle = [
    Icon(Icons.add_circle_outline, color: Colors.black),
    Icon(Icons.check_circle_outlined, color: Colors.black)
  ];
  var colorToggle = [lightGrey, Colors.grey];
  var iconToggleIndices = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  var colorToggleIndices = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  int indexChosen = -1;

  Icon getSelectionState(int index, int indexChosen) {
    if (indexChosen == index) {
      iconToggleIndices[index] = (iconToggleIndices[index] + 1) % 2;
      return iconToggle[iconToggleIndices[index]];
    } else {
      return iconToggle[iconToggleIndices[index]];
    }
  }

  Color getColorState(int index, int indexChosen) {
    if (indexChosen == index) {
      colorToggleIndices[index] = (colorToggleIndices[index] + 1) % 2;
      return colorToggle[colorToggleIndices[index]];
    } else {
      return colorToggle[colorToggleIndices[index]];
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.6,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 11,
        itemBuilder: (context, index) {
          if (index == 0 || index == 10) return const SizedBox.shrink();
          return SizedBox(
            height: size.height * 0.065,
            child: ListTile(
              leading: iconList[index - 1],
              title: Text(leagueNames[index - 1]),
              tileColor: getColorState(index - 1, indexChosen - 1),
              trailing: GestureDetector(
                  child: Container(
                    child: getSelectionState(index - 1, indexChosen - 1),
                  ),
                  onTap: () {
                    setState(() {
                      indexChosen = index;
                    });
                  }),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.black,
            thickness: 1,
            height: 1,
          );
        },
      ),
    );
  }
}
