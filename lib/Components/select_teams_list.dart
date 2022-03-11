import 'package:flutter/material.dart';

import '../constants.dart';

class SelectTeamsList extends StatefulWidget {
  var leagueAndTeams;
  SelectTeamsList({Key? key, required this.leagueAndTeams}) : super(key: key);
  @override
  State<SelectTeamsList> createState() => _SelectTeamsListState();
}

class _SelectTeamsListState extends State<SelectTeamsList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.6,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: widget.leagueAndTeams.length + 2,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0 || index == widget.leagueAndTeams.length + 1)
            return const SizedBox.shrink();
          return buildTeamList(widget.leagueAndTeams[index - 1]);
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
      color: Colors.grey,
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
              color: lightGrey,
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                primary: false,
                itemCount: leagueAndTeam['IconsAndTeams'].length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) return const SizedBox.shrink();
                  return SizedBox(
                    height: size.height * 0.065,
                    child: ListTile(
                      leading: leagueAndTeam['IconsAndTeams'][index - 1]
                          ['icon'],
                      title: Text(
                          leagueAndTeam['IconsAndTeams'][index - 1]['team']),
                      tileColor: lightGrey,
                      trailing: Icon(Icons.add_circle_outline_outlined),
                      iconColor: Colors.black,
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
            iconColor:
            Colors.black;
            textColor:
            Colors.black;
          },
        ),
      ),
    );
  }
}
