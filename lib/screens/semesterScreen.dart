import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mora_gpa/classes/ScreenSize.dart';
import 'package:mora_gpa/constants/colors.dart';
import 'package:mora_gpa/database/Controller.dart';
import 'package:mora_gpa/screens/addSubjectScreen.dart';
import 'package:mora_gpa/widgets/subjectCard.dart';

class SemesterScreen extends StatefulWidget {
  SemesterScreen({this.semesterNo});
  final int semesterNo;
  @override
  _SemesterScreenState createState() => _SemesterScreenState();
}

class _SemesterScreenState extends State<SemesterScreen> {
  dynamic subjects = [];
  _setupSubjects() async {
    subjects = await Controller.getAllModules(widget.semesterNo);
    return subjects;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _setupSubjects(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              backgroundColor: kbackgroundColor,
              appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.black),
                title: Text(
                  'Semester ' + widget.semesterNo.toString(),
                  style: TextStyle(
                      fontSize: ScreenSize.getMinimumSize(context) * .06944,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                      color: Colors.black),
                ),
                centerTitle: true,
              ),
              body: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                        child: AnimationLimiter(
                          child: ListView.builder(
                            itemCount: subjects.length + 1,
                            itemBuilder: (BuildContext context, int index) {
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 500),
                                child: SlideAnimation(
                                  horizontalOffset: 50.0,
                                  child: FadeInAnimation(
                                    child: (index == 0)
                                        ? Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 0, 8, 15),
                                            child: RaisedButton(
                                              color: klightBackgroundColor,
                                              textColor: kPrimaryColor,
                                              elevation: 5,
                                              shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      color: kPrimaryColor,
                                                      width: 2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 18, 10, 18),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddSubjectScreen(
                                                      semester:
                                                          widget.semesterNo,
                                                    ),
                                                  ),
                                                ).then((value) {
                                                  setState(() {});
                                                });
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  FaIcon(
                                                    FontAwesomeIcons.plusSquare,
                                                    size: ScreenSize
                                                            .getMinimumSize(
                                                                context) *
                                                        .064,
                                                  ),
                                                  SizedBox(
                                                    width: 13,
                                                  ),
                                                  Text(
                                                    'Add New Module',
                                                    style: TextStyle(
                                                        fontSize: ScreenSize
                                                                .getMinimumSize(
                                                                    context) *
                                                            .057),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : SubjectCard(
                                            subject: subjects[index - 1],
                                            semester: widget.semesterNo,
                                            onDelete: () {
                                              setState(() {});
                                            },
                                          ),
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
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
