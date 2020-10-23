import 'package:mora_gpa/classes/Semesters.dart';
import 'package:mora_gpa/classes/gradingCriteria.dart';
import 'package:mora_gpa/database/Model.dart';
import 'package:mora_gpa/database/Module.dart';

class Controller {
  static DatabaseHelper helper = DatabaseHelper();
  static addSubject(Map<String, dynamic> data) async {
    Module module =
        Module(data['semester'], data['name'], data['grade'], data['credits']);
    await helper.insertModule(module);
  }

  static getAllModules(semesterNo) async {
    dynamic modules = await helper.getModuleBySemesterList(semesterNo);
    var result = [];
    for (var i = 0; i < modules.length; i++) {
      result.add(
        {
          'id': modules[i].id,
          'name': modules[i].name,
          'grade': GradingCriteria.getGradeString(modules[i].grade),
          'credits': modules[i].credits,
        },
      );
    }
    return result;
  }

  static getSemesterGPAs() async {
    var semesters = Semesters.getAllSemesters();
    var result = [];

    for (var i = 0; i < semesters.length; i++) {
      //get statement for getting subjects of each semester
      dynamic modules = await helper.getModuleBySemesterList(i + 1);
      double weightedSum = 0;
      double totCredits = 0;
      for (var j = 0; j < modules.length; j++) {
        double grade = (modules[j].grade);
        double credits = (modules[j].credits);
        weightedSum += grade * credits;
        totCredits += credits;
      }
      totCredits = (totCredits == 0) ? 1 : totCredits;
      double SGPA = (weightedSum / totCredits);
      result.add({
        'semesterName': semesters[i].semesterName,
        'semesterNo': semesters[i].semesterNumber,
        'gpa': SGPA,
      });
    }
    return result;
  }

  static getCGPA() async {
    dynamic allModules = await helper.getModuleList();
    if (allModules.length != 0) {
      double weightedSum = 0;
      double totCredits = 0;
      for (var i = 0; i < allModules.length; i++) {
        double grade = (allModules[i].grade);
        double credits = (allModules[i].credits);
        weightedSum += grade * credits;
        totCredits += credits;
      }
      totCredits = (totCredits == 0) ? 1 : totCredits;
      double CGPA = (weightedSum / totCredits);
      return {'CGPA': CGPA, 'totalCredits': totCredits};
    } else {
      return {'CGPA': 0, 'totalCredits': 0};
    }
  }

  static deleteModule(String id) async {
    await helper.deleteModule(id);
  }
}
