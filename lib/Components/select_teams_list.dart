import 'package:flutter/material.dart';
import 'package:sign_ups/model/leagues.dart';
import '../constants.dart';

class SelectTeamsList extends StatefulWidget {
  SelectTeamsList({
    Key? key,
  }) : super(key: key);
  @override
  State<SelectTeamsList> createState() => _SelectTeamsListState();
}

class _SelectTeamsListState extends State<SelectTeamsList> {
  bool isOpen = false;
  var iconToggle = [
    Icon(Icons.add_circle_outline, color: Colors.black),
    Icon(Icons.check_circle_outlined, color: Colors.black)
  ];
  var colorToggle = [lightGrey, Colors.grey];
  int indexChosen = -1;

  Icon getIconState(int index, int indexChosen, var leagueAndTeam) {
    if (indexChosen == index) {
      iconToggleIndices[index] = (iconToggleIndices[index] + 1) % 2;
      if (iconToggleIndices[index] == 1) {
        selectedBasketballTeams
            .add(leagueAndTeam['IconsAndTeams'][index]['team']);
      } else {
        int idx = selectedBasketballTeams
            .indexOf(leagueAndTeam['IconsAndTeams'][index]['team']);
        selectedBasketballTeams.removeAt(idx);
      }
      for (int i = 0; i < selectedBasketballTeams.length; i++) {
        print(selectedBasketballTeams[i]);
      }
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
        physics: BouncingScrollPhysics(),
        itemCount: leagueAndTeams.length + 2,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0 || index == leagueAndTeams.length + 1)
            return const SizedBox.shrink();
          return buildTeamList(leagueAndTeams[index - 1]);
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

  Widget buildTeamList(var leagueAndTeam) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: isOpen ? Colors.grey : lightGrey,
      child: Theme(
        data: Theme.of(context).copyWith(
          unselectedWidgetColor: Colors.black, // here for close state
          colorScheme: ColorScheme.light(
            primary: Colors.black,
          ), // here for open state in replacement of deprecated accentColor
          dividerColor: Colors.transparent, // if you want to remove the border
        ),
        child: ExpansionTile(
          title: Container(
            child: Text(
              leagueAndTeam['league'],
              style: TextStyle(
                fontFamily: "Oxanium",
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.black,
              ),
            ),
          ),
          children: [
            Container(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                primary: false,
                itemCount: leagueAndTeam['IconsAndTeams'].length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) return const SizedBox.shrink();
                  return SizedBox(
                    height: size.height * 0.065,
                    child: Container(
                      color: getColorState(index - 1, indexChosen - 1),
                      child: ListTile(
                        leading: leagueAndTeam['IconsAndTeams'][index - 1]
                            ['icon'],
                        title: Text(
                            leagueAndTeam['IconsAndTeams'][index - 1]['team']),
                        trailing: GestureDetector(
                          child: Container(
                            child: getIconState(
                                index - 1, indexChosen - 1, leagueAndTeam),
                          ),
                          onTap: () {
                            setState(
                              () {
                                indexChosen = index;
                              },
                            );
                          },
                        ),
                      ),
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
            )
          ],
          onExpansionChanged: (changed) {
            setState(() {
              isOpen = !isOpen;
            });
            for (int i = 0; i < selectedBasketballTeams.length; i++) {
              print(selectedBasketballTeams[i]);
            }
          },
        ),
      ),
    );
  }
}
