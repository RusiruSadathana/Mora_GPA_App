import 'package:flutter/material.dart';
import 'package:mora_gpa/classes/ScreenSize.dart';
import 'package:mora_gpa/constants/colors.dart';
import 'package:mora_gpa/screens/semesterScreen.dart';

class SemesterGPACard extends StatelessWidget {
  const SemesterGPACard({this.title, this.gpa, this.semesterNo});
  final String title;
  final double gpa;
  final int semesterNo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SemesterScreen(
              semesterNo: semesterNo,
            ),
          ),
        ),
      },
      child: Card(
        elevation: 5,
        color: klightBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.fromLTRB(ScreenSize.getMinimumSize(context) * .0347,
            10, ScreenSize.getMinimumSize(context) * .0347, 10),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: ScreenSize.getMinimumSize(context) * .052,
                        color: kPrimaryColor),
                  ),
                  SizedBox(height: ScreenSize.getHeight(context) * .01),
                  Text(
                    gpa.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: ScreenSize.getMinimumSize(context) * .081,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
