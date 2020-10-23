import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mora_gpa/constants/colors.dart';
import 'package:mora_gpa/database/Controller.dart';
import 'package:mora_gpa/widgets/semesterGPACard.dart';

class AllSemesters extends StatefulWidget {
  @override
  _AllSemestersState createState() => _AllSemestersState();
}

class _AllSemestersState extends State<AllSemesters> {
  dynamic widLst;

  _setupGPACards() async {
    dynamic result = await Controller.getSemesterGPAs();
    widLst = result.map((semester) {
      return SemesterGPACard(
        title: semester['semesterName'],
        semesterNo: semester['semesterNo'],
        gpa: semester['gpa'],
      );
    }).toList();
    return widLst;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _setupGPACards(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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
          } else {
            return Center(
                child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(kPrimaryColor),
            ));
          }
        });
  }
}
