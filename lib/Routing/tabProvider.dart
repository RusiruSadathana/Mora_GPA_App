import 'package:flutter/cupertino.dart';
import 'package:mora_gpa/database/Controller.dart';
import 'package:mora_gpa/screens/tabs/CGPA.dart';
import 'package:mora_gpa/screens/tabs/allSemesters.dart';

class TabNavigator {
  static provideTab(String title) async {
    if (title == 'CGPA') {
      dynamic data = await Controller.getCGPA();
      return CGPA(data: data);
    } else if (title == 'Semesters') {
      return AllSemesters();
    } else {
      return Center(
        child: Text('Some Thing Went Wrong'),
      );
    }
  }
}
