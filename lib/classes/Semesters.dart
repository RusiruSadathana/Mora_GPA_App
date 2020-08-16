import 'package:mora_gpa/classes/Semester.dart';

class Semesters {
  static List allSemesters = [
    Semester('Semester 1', 1),
    Semester('Semester 2', 2),
    Semester('Semester 3', 3),
    Semester('Semester 4', 4),
    Semester('Semester 5', 5),
    Semester('Semester 6', 6),
    Semester('Semester 7', 7),
    Semester('Semester 8', 8),
  ];

  static getAllSemesters() {
    return allSemesters;
  }
}
