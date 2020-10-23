import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mora_gpa/classes/Semesters.dart';
import 'package:mora_gpa/classes/gradingCriteria.dart';
import 'package:mora_gpa/constants/colors.dart';
import 'package:mora_gpa/constants/styles.dart';
import 'package:mora_gpa/database/Controller.dart';
import 'package:mora_gpa/screens/HomeScreen.dart';
import 'package:mora_gpa/widgets/Dropdownformfield.dart';
import 'package:mora_gpa/widgets/gradingTable.dart';

class AddSubjectScreen extends StatefulWidget {
  AddSubjectScreen({this.semester, this.currentIndex});
  final int semester;
  final int currentIndex;
  @override
  _AddSubjectScreenState createState() => _AddSubjectScreenState();
}

class _AddSubjectScreenState extends State<AddSubjectScreen> {
  String _subjectName;
  int _semesterValue;
  double _grade;
  double _credits;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _subjectName = '';
    _semesterValue = null;
    _grade = null;
    _credits = null;
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      Controller.addSubject({
        'semester': (_semesterValue != null) ? _semesterValue : widget.semester,
        'name': _subjectName,
        'grade': _grade,
        'credits': _credits,
      });
      (widget.semester != null)
          ? Navigator.pop(context, false)
          : Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(
                  initIndex: widget.currentIndex,
                ),
              ),
            );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => (widget.semester != null)
              ? Navigator.pop(context, false)
              : Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(
                      initIndex: widget.currentIndex,
                    ),
                  ),
                ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Add Module',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.5,
              color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 375),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      horizontalOffset: 50.0,
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        style: TextStyle(fontSize: 20),
                        maxLength: 30,
                        decoration: kTextFormFieldDecoration,
                        onChanged: (value) {
                          setState(() {
                            _subjectName = value;
                          });
                        },
                        validator: (value) {
                          if (value.length == 0) {
                            return "Module Name cannot be empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: (widget.semester == null)
                                  ? DropDownFormField(
                                      titleText: 'Semester',
                                      hintText: 'Choose one',
                                      value: _semesterValue,
                                      textField: 'display',
                                      valueField: 'value',
                                      dataSource: Semesters.getAllSemesters()
                                          .map((semester) {
                                        return {
                                          'display': semester.semesterName,
                                          'value': semester.semesterNumber,
                                        };
                                      }).toList(),
                                      validator: (value) {
                                        if (value == null) {
                                          return "Semester cannot be empty";
                                        } else {
                                          return null;
                                        }
                                      },
                                      onChanged: (value) {
                                        setState(() {
                                          _semesterValue = value;
                                        });
                                      },
                                      onSaved: (value) {
                                        setState(() {
                                          _semesterValue = value;
                                        });
                                      },
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Semester',
                                          style: TextStyle(
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          widget.semester.toString(),
                                          style: TextStyle(
                                            fontSize: 22.5,
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              child: DropDownFormField(
                                titleText: 'Grade',
                                hintText: 'Choose one',
                                errorText: 'Please chose a grade',
                                value: _grade,
                                textField: 'display',
                                valueField: 'value',
                                dataSource: GradingCriteria.schema.map((grade) {
                                  return {
                                    'display': grade.grade,
                                    'value': grade.weight,
                                  };
                                }).toList(),
                                validator: (value) {
                                  if (value == null) {
                                    return "Grade cannot be empty";
                                  } else {
                                    return null;
                                  }
                                },
                                onChanged: (value) {
                                  setState(() {
                                    _grade = value;
                                  });
                                },
                                onSaved: (value) {
                                  setState(() {
                                    _grade = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Credits',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                              ),
                            ),
                            TextFormField(
                              style: TextStyle(fontSize: 20),
                              keyboardType: TextInputType.number,
                              maxLength: 5,
                              textAlign: TextAlign.center,
                              decoration: kCreditFormFieldDecoration,
                              onChanged: (value) {
                                setState(() {
                                  _credits = double.parse(value);
                                });
                              },
                              validator: (value) {
                                if (value == null || value == '') {
                                  return "Number of credits cannot be empty";
                                } else {
                                  try {
                                    double val = double.parse(value);
                                    if (val <= 0) {
                                      return "Credits should be a positive value";
                                    }
                                    return null;
                                  } catch (e) {
                                    return "Enter a valid amount of credits";
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                        color: kPrimaryColor,
                        onPressed: () {
                          _saveForm();
                        },
                        child: Text(
                          'Add Module',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                        child: Text(
                          'Grading Criteria',
                          style: TextStyle(
                            fontSize: 25,
                            letterSpacing: 1.25,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      AbsorbPointer(
                        absorbing: true,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: GradingTable(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
