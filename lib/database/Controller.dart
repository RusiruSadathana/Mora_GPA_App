import 'package:mora_gpa/classes/Semesters.dart';
import 'package:mora_gpa/classes/gradingCriteria.dart';

class Controller {
  static addSubject(Map<String, dynamic> data) {
    print(data);
  }

  static getAllModules(semesterNo) {
    //this should be taken from database
    var subjects = [
      {'name': 'Mathematics', 'grade': 4.0, 'credits': 3.0},
      {'name': 'OOSD', 'grade': 4.2, 'credits': 2.5},
      {'name': 'Archi', 'grade': 3.7, 'credits': 2.0},
      {'name': 'Mathematics', 'grade': 3.3, 'credits': 3.0},
      {'name': 'OOSD', 'grade': 3.0, 'credits': 2.5},
      {'name': 'Archi', 'grade': 2.7, 'credits': 2.0},
      {'name': 'Mathematics', 'grade': 2.3, 'credits': 3.0},
      {'name': 'OOSD', 'grade': 2.0, 'credits': 2.5},
      {'name': 'Archi', 'grade': 0.0, 'credits': 2.0},
    ];
    var result = [];
    for (var i = 0; i < subjects.length; i++) {
      result.add(
        {
          'name': subjects[i]['name'],
          'grade': GradingCriteria.getGradeString(subjects[i]['grade']),
          'credits': subjects[i]['credits'],
        },
      );
    }
    return result;
  }

  static getSemesterGPAs() {
    var semesters = Semesters.getAllSemesters();
    var result = [];
    for (var i = 0; i < semesters.length; i++) {
      //get statement for getting subjects of each semester
      result.add({
        'semesterName': semesters[i].semesterName,
        'semesterNo': semesters[i].semesterNumber,
        'gpa': 4.15,
      });
    }
    return result;
  }

  static getCGPA() {
    var allModules = [
      {'name': 'Mathematics', 'grade': 4.0, 'credits': 3.0},
      {'name': 'OOSD', 'grade': 4.2, 'credits': 2.5},
      {'name': 'Archi', 'grade': 3.7, 'credits': 2.0},
      {'name': 'Mathematics', 'grade': 3.3, 'credits': 3.0},
      {'name': 'OOSD', 'grade': 3.0, 'credits': 2.5},
      {'name': 'Archi', 'grade': 2.7, 'credits': 2.0},
      {'name': 'Mathematics', 'grade': 2.3, 'credits': 3.0},
      {'name': 'OOSD', 'grade': 2.0, 'credits': 2.5},
      {'name': 'Archi', 'grade': 0.0, 'credits': 2.0},
    ];
    double weightedSum = 0;
    double totCredits = 0;
    for (var i = 0; i < allModules.length; i++) {
      double grade = (allModules[i]['grade']);
      double credits = (allModules[i]['credits']);
      weightedSum += grade * credits;
      totCredits += credits;
    }
    double CGPA = (weightedSum / totCredits);
    return {'CGPA': CGPA, 'totalCredits': totCredits};
  }

  static deleteModule(data) {
    print(data);
  }
}
