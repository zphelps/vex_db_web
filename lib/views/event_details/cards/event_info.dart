import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vex_db_web/models/event.dart';

class EventInfo extends StatelessWidget {
  const EventInfo({required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    List<String> infoLabels = [
      'Dates',
      'Season',
      'Program',
      'Venue',
      'Address',
      'Zip / Postal Code',
      'City',
      'State',
      'Country',
    ];
    List<String> infoData = [
      '${DateFormat.yMEd().format(DateTime.parse(event.start))} - ${DateFormat.yMEd().format(DateTime.parse(event.end))}',
      event.season.code,
      event.program.code,
      event.location.venue,
      event.location.address1,
      event.location.postCode,
      event.location.city,
      event.location.region,
      event.location.country,
    ];
    return Container(
      width: MediaQuery.of(context).size.width * 0.35,
      child: Column(
        children: [
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            child: const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Event Info',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.vertical(top: Radius.circular(8))
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: infoData.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        infoLabels[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        infoData[index],
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(height: 20);
              },
            )
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
    );
  }
}
