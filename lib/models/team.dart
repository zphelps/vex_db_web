import 'package:vex_db_web/models/IDInfo.dart';
import 'package:vex_db_web/models/location.dart';

class Team {
  int id;
  String number;
  IDInfo program;
  String teamName;
  String robotName;
  String organization;
  String grade;
  Location location;

  Team({
    required this.id,
    required this.number,
    required this.program,
    required this.teamName,
    required this.robotName,
    required this.organization,
    required this.grade,
    required this.location,
});
}