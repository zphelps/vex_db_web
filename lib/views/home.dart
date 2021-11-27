import 'package:flutter/material.dart';
import 'package:vex_db_web/views/events/events_list.dart';
import 'package:vex_db_web/views/teams/teams_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Text(
                'Header'
              ),
            ),
            Text(
              'Text'
            ),
            Text(
                'Text'
            ),
            Text(
                'Text'
            ),
            Text(
                'Text'
            ),
            Text(
                'Text'
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            child: Text(
              'Home',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 20),
          TextButton(
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            child: Text(
                'Teams',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 20),
          TextButton(
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            child: Text(
                'Events',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 20),
          TextButton(
            onPressed: () {

            },
            child: Text(
              'Skills',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {

            },
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 15),
        ],
        backgroundColor: Colors.blueGrey,
        title: Text(
          'VEX DB'
        ),
      ),
      body: () {
        switch (pageIndex) {
          case 0: {
            return Container();
          }
          case 1: {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.035,
                  vertical: MediaQuery.of(context).size.height * 0.025
              ),
              child: TeamsList(),
            );
          }
          case 2: {
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.035,
                  vertical: MediaQuery.of(context).size.height * 0.025
              ),
              child: EventsList(),
            );
          }
        }
      }(),

    );
  }
}
