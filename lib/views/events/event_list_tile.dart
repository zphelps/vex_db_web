import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vex_db_web/models/event.dart';
import 'package:vex_db_web/views/event_details/event_details.dart';

class EventListTile extends StatelessWidget {
  const EventListTile({required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              event.program.code,
            ),
          ),
          Expanded(
            flex: 7,
            child: TextButton(
              onPressed: () {
                Navigator.push(context, PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) {
                    return EventDetails(event: event);
                  },
                  transitionDuration: Duration.zero,
                ));
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  event.name,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              event.start != 'Null' ? DateFormat.yMd().format(DateTime.parse(event.start)) : 'Null',
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              '${event.location.city}, ${event.location.country}',
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
