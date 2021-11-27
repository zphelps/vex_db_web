
import 'package:vex_db_web/models/IDInfo.dart';
import 'package:vex_db_web/models/division.dart';
import 'package:vex_db_web/models/location.dart';

class Event {
  int id;
  String sku;
  String name;
  String start;
  String end;
  IDInfo season;
  IDInfo program;
  Location location;
  List<Division> divisions;
  String level;
  bool ongoing;
  bool awardsFinalized;
  String eventType;

  Event({
    required this.id,
    required this.sku,
    required this.name,
    required this.start,
    required this.end,
    required this.season,
    required this.program,
    required this.location,
    required this.divisions,
    required this.level,
    required this.ongoing,
    required this.awardsFinalized,
    required this.eventType,
  });
}