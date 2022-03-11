import 'package:flutter/material.dart';

class SelectTeamsList extends StatefulWidget {
  var LeagueAndTeams;
  SelectTeamsList({Key? key, required this.LeagueAndTeams}) : super(key: key);

  @override
  State<SelectTeamsList> createState() => _SelectTeamsListState();
}

class _SelectTeamsListState extends State<SelectTeamsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return Container();
        },
      ),
    );
  }
}
