import 'package:flutter/material.dart';
import 'package:mora_gpa/constants/colors.dart';
import 'package:mora_gpa/screens/loadScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mora GPA',
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Rubik',
        primaryColor: kPrimaryColor,
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          color: klightBackgroundColor,
          elevation: 5,
        ),
      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: LoadScreen(),
    );
  }
}
