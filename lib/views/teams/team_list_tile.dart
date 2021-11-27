import 'package:flutter/material.dart';
import 'package:vex_db_web/models/team.dart';

class TeamListTile extends StatelessWidget {
  const TeamListTile({required this.team});

  final Team team;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              team.program.code,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              team.number,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              team.teamName,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              team.organization,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              '${team.location.city}, ${team.location.country}',
            ),
          ),
          // const Expanded(
          //   flex: 1,
          //   child: SizedBox(),
          // )
        ],
      ),
    );
  }
}
