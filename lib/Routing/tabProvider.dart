import 'package:flutter/cupertino.dart';
import 'package:mora_gpa/screens/tabs/CGPA.dart';
import 'package:mora_gpa/screens/tabs/allSemesters.dart';

class TabNavigator {
  static provideTab(String title) {
    if (title == 'CGPA') {
      return CGPA();
    } else if (title == 'Semesters') {
      return AllSemesters();
    } else {
      return Center(
        child: Text('hi'),
      );
    }
  }
}
