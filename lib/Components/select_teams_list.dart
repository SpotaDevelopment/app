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
    return ExpansionTile(
      title: Text(
        leagueAndTeam['league'],
        style: TextStyle(
          fontFamily: "Oxanium",
          fontWeight: FontWeight.bold,
          fontSize: 17,
        ),
      ),
      children: [
        ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          primary: false,
          itemCount: leagueAndTeam['IconsAndTeams'].length + 1,
          itemBuilder: (context, index) {
            if (index == 0) return const SizedBox.shrink();
            return SizedBox(
              height: size.height * 0.065,
              child: ListTile(
                leading: leagueAndTeam['IconsAndTeams'][index - 1]['icon'],
                title: Text(leagueAndTeam['IconsAndTeams'][index - 1]['team']),
                tileColor: lightGrey,
              ),
            );
          },
          separatorBuilder: (context, index) {
            print(leagueAndTeam['IconsAndTeams'].length);
            return Divider(
              color: Colors.black,
              thickness: 1,
              height: 1,
            );
          },
        ),
      ],
    );
  }
}
