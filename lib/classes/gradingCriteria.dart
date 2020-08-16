import 'package:mora_gpa/classes/Grade.dart';

class GradingCriteria {
  static List<Grade> schema = [
    Grade('A+', 4.2),
    Grade('A', 4.0),
    Grade('A-', 3.7),
    Grade('B+', 3.3),
    Grade('B', 3.0),
    Grade('B-', 2.7),
    Grade('C+', 2.3),
    Grade('C', 2.0),
    Grade('C-', 1.5),
    Grade('D', 1.0),
    Grade('Others', 0.0),
  ];

  static getGradingCriteria() {
    return schema;
  }

  static getGradeString(gradeValue) {
    for (var i = 0; i < schema.length; i++) {
      if (gradeValue == schema[i].weight) {
        return schema[i].grade;
      }
    }
  }
}
