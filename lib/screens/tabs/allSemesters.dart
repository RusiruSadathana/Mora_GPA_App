import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mora_gpa/constants/colors.dart';
import 'package:mora_gpa/widgets/semesterGPACard.dart';

class AllSemesters extends StatefulWidget {
  @override
  _AllSemestersState createState() => _AllSemestersState();
}

class _AllSemestersState extends State<AllSemesters> {
  static const widLst = [
    SemesterGPACard(
      title: 'Semester 1',
      gpa: 3.47,
      semesterNo: 1,
    ),
    SemesterGPACard(
      title: 'Semester 2',
      gpa: 3.47,
      semesterNo: 2,
    ),
    SemesterGPACard(
      title: 'Semester 3',
      gpa: 3.47,
      semesterNo: 3,
    ),
    SemesterGPACard(
      title: 'Semester 4',
      gpa: 3.47,
      semesterNo: 4,
    ),
    SemesterGPACard(
      title: 'Semester 5',
      gpa: 3.47,
      semesterNo: 5,
    ),
    SemesterGPACard(
      title: 'Semester 6',
      gpa: 3.47,
      semesterNo: 6,
    ),
    SemesterGPACard(
      title: 'Semester 7',
      gpa: 3.47,
      semesterNo: 7,
    ),
    SemesterGPACard(
      title: 'Semester 8',
      gpa: 3.47,
      semesterNo: 8,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kbackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              child: AnimationLimiter(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.35,
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                  ),
                  itemCount: widLst.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          child: widLst[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
