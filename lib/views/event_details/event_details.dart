import 'package:flutter/material.dart';
import 'package:vex_db_web/models/event.dart';
import 'package:vex_db_web/views/event_details/cards/event_info.dart';

import '../home.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({required this.event});

  final Event event;

  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {

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
              Navigator.push(context, PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) {
                  return Home();
                },
                transitionDuration: Duration.zero,
              ));
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
              pageIndex = 3;
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
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.event.name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w100,
              ),
            ),
            const Divider(height: 50),
            EventInfo(event: widget.event),
          ],
        ),
      ),
    );
  }
}
