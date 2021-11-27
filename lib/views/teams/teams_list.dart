import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:vex_db_web/models/IDInfo.dart';
import 'package:vex_db_web/models/location.dart';
import 'package:vex_db_web/models/team.dart';
import 'package:vex_db_web/views/teams/team_list_tile.dart';

class TeamsList extends StatefulWidget {
  const TeamsList({Key? key}) : super(key: key);

  @override
  _TeamsListState createState() => _TeamsListState();
}

class _TeamsListState extends State<TeamsList> {

  late Future<List<Team>> teams;
  int currentPage = 1;

  Future<List<Team>> fetchTeams(int page) async {

    try{
      // make the request
      Response response = await get(Uri.parse('https://www.robotevents.com/api/v2/teams?per_page=25&page=$page'), headers: {
        'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZDdiZmZmNzE3MjVjODhlNzk5YTAyMWFiNzBmMmE3MDk0ODgyZTlkZDhhMDczNWM1NzAwZmQ2MTQ0MTU1NTRhZDE0MDA5NzQ1M2VmNDg3ZjMiLCJpYXQiOjE2MzYwNDc2OTkuNjE4MjgwOSwibmJmIjoxNjM2MDQ3Njk5LjYxODI4NDksImV4cCI6MjU4MjczNjA5OS41NjE5NDUsInN1YiI6IjM4MDg5Iiwic2NvcGVzIjpbXX0.bpU2Nk74KUCMDNIPd_Y5zv5VYe34bP5Kg_3QOrmcDQcGi3g2RX16akj22DM-VCU-N55Nh_3ZGQUft-YFQWjfqZ55AmWCnkVEXcMw8jMZ-0-Y2HnBsXx6uI3ObPsm_AA1wLLHLOvWeubHtO1NwxhiWMWcFY7DZomOs-JN5Brn7b-_PUkOKiJR4HfHL5kce4KNIL8w2j5IS9tVngtq8-hvR7ENVwnUX1Rt5mH5teikymW07TXhtu2ATdCS3YB7ztu8-Oqvu14Irrwy7tFXm8VGKPQM62f_N1F3fXaa-uLZjwGFOjMeSw0a6pcRexkk-cPhmKp4hAjl-V4TBCuurEoVB7GtECuUH9S4iIAI5ArYbawEvoH8ovAlkZ1LMKtBdWwW7mNEm3O9mfN-mC60Xq0Z34UdaC6p-zvmOIO9LHEJ0Sjr2sERdVFFS3s1dYnhSADcQIUg_teAddqXkxGxIq9_gSu482u_ic53jOqwzAFNsgg_emjoUiYLwfYEW11-kzPAnEuNzIQB2sXWvnBrbfGv-6HXSSxWYswfsoYdKSoBMPWldERJF2xXkByynQHCmqfsRw8B0rAXQnIMkeERE1zX5YY4c_rzvyPL_c7TmOPTbhGlC9GuUR_C3LhWd3NYdQPo0YnhIguQyhJYc8oHSjSU-XEYjxiOk6UTCsFllreC2E4'
      });
      Map data = jsonDecode(response.body);

      // get properties from json
      // String datetime = data['datetime'];
      // String offset = data['utc_offset'].substring(1,3);
      // teams = data['data'];

      List<Team> teamsToReturn = [];

      for(Map team in data['data']) {
        teamsToReturn.add(Team(
          id: team['id'],
          number: team['number'] ?? 'Null',
          grade: team['grade'] ?? 'Null',
          program: IDInfo(
            id: team['program']['id'] ?? 0,
            name: team['program']['name'] ?? 'Null',
            code: team['program']['code'] ?? 'Null',
          ),
          robotName: team['robot_name'] ?? 'Null',
          teamName: team['team_name'] ?? 'Null',
          organization: team['organization'] ?? 'Null',
          location: Location(
            venue: team['location']['venue'] ?? 'Null',
            address1: team['location']['address_1'] ?? 'Null',
            address2: team['location']['address_2'] ?? 'Null',
            city: team['location']['city'] ?? 'Null',
            region: team['location']['region'] ?? 'Null',
            postCode: team['location']['postcode'] ?? 'Null',
            country: team['location']['country'] ?? 'Null',
          ),
        ));
      }

      return teamsToReturn;

    }
    catch (e) {
      print(e);
    }

    return [Team(
        id: 0000,
        number: 'Null',
        grade: 'Null',
        robotName: 'Null',
        teamName: 'Null',
        organization: 'Null',
      program: IDInfo(
        id: 0,
        name: 'Null',
        code: 'Null',
      ),
      location: Location(
        venue: 'Null',
        address1: 'Null',
        address2: 'Null',
        city: 'Null',
        region: 'Null',
        postCode: 'Null',
        country: 'Null',
      ),
    )];
  }

  @override
  void initState() {
    super.initState();
    teams = fetchTeams(currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Teams',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w100,
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: Row(
                    children: const [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Program',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Number',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Team Name',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Organization',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Location',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(5))
                  ),
                ),
                Expanded(
                  child: FutureBuilder(
                    future: teams,
                    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                      if(snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
                        return ListView.separated(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return TeamListTile(team: snapshot.data[index]);
                          },
                          separatorBuilder: (context, index) {
                            return const Divider(height: 0);
                          },
                        );
                      }
                      else {
                        return const Center(
                          child: SizedBox(
                            height: 75,
                            width: 75,
                            child: LoadingIndicator(
                              indicatorType: Indicator.ballRotateChase,
                              colors: [Colors.blue, Colors.blueGrey, Colors.grey],
                            ),
                          ),
                        );
                      }
                    }
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 1,
                  color: Colors.black.withOpacity(0.15),
                  offset: const Offset(1, 1),
                )
              ]
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          width: 125,
          height: 35,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              () {
                if(currentPage > 1) {
                  return Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              currentPage--;
                              teams = fetchTeams(currentPage);
                            });
                          },
                          child: const Icon(
                            Icons.chevron_left,
                            color: Colors.blueGrey,
                          )
                      ),
                      const VerticalDivider(
                        width: 0,
                      )
                    ],
                  );
                }
                return const SizedBox();
              }(),
              TextButton(
                onPressed: () {
                  setState(() {
                    currentPage++;
                    teams = fetchTeams(currentPage);
                  });
                },
                child: const Icon(
                  Icons.chevron_right,
                  color: Colors.blueGrey,
                )
              ),
            ],
          ),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8)
          ),
        ),
      ],
    );
  }
}
