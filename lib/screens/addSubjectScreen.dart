import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mora_gpa/constants/colors.dart';
import 'package:mora_gpa/constants/styles.dart';
import 'package:mora_gpa/widgets/Dropdownformfield.dart';
import 'package:mora_gpa/widgets/gradingTable.dart';

class AddSubjectScreen extends StatefulWidget {
  @override
  _AddSubjectScreenState createState() => _AddSubjectScreenState();
}

class _AddSubjectScreenState extends State<AddSubjectScreen> {
  int currentValue = 0;
  int selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      appBar: AppBar(
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
                      decoration: kTextFormFieldDecoration,
                      onChanged: (value) {},
                      validator: (val) {
                        if (val.length == 0) {
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
                            child: DropDownFormField(
                              titleText: 'Semester',
                              hintText: 'Please choose one',
                              value: null,
                              textField: 'display',
                              dataSource: [
                                {
                                  "display": "Sem1",
                                  "value": '2',
                                },
                                {
                                  "display": "Sems 2",
                                  "value": '2',
                                },
                                {
                                  "display": "Sem1",
                                  "value": '2',
                                },
                                {
                                  "display": "Sems 2",
                                  "value": '2',
                                },
                                {
                                  "display": "Sem1",
                                  "value": '2',
                                },
                                {
                                  "display": "Sems 2",
                                  "value": '2',
                                },
                                {
                                  "display": "Sem1",
                                  "value": '2',
                                },
                                {
                                  "display": "Sems 2",
                                  "value": '2',
                                }
                              ],
                              onChanged: (value) {},
                              onSaved: (value) {},
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            child: DropDownFormField(
                              titleText: 'Credits',
                              hintText: 'Please choose one',
                              value: null,
                              textField: 'display',
                              dataSource: [
                                {
                                  "display": "Sem1",
                                  "value": '2',
                                },
                                {
                                  "display": "Sems 2",
                                  "value": '2',
                                },
                                {
                                  "display": "Sem1",
                                  "value": '2',
                                },
                                {
                                  "display": "Sems 2",
                                  "value": '2',
                                },
                                {
                                  "display": "Sem1",
                                  "value": '2',
                                },
                                {
                                  "display": "Sems 2",
                                  "value": '2',
                                },
                                {
                                  "display": "Sem1",
                                  "value": '2',
                                },
                                {
                                  "display": "Sems 2",
                                  "value": '2',
                                }
                              ],
                              onChanged: (value) {},
                              onSaved: (value) {},
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: SizedBox(
                          width: 15,
                        )),
                        Expanded(
                          child: Container(
                            child: DropDownFormField(
                              titleText: 'Grade',
                              hintText: 'Please choose one',
                              value: null,
                              textField: 'display',
                              dataSource: [
                                {
                                  "display": "Sem1",
                                  "value": '2',
                                },
                                {
                                  "display": "Sems 2",
                                  "value": '2',
                                },
                                {
                                  "display": "Sem1",
                                  "value": '2',
                                },
                                {
                                  "display": "Sems 2",
                                  "value": '2',
                                },
                                {
                                  "display": "Sem1",
                                  "value": '2',
                                },
                                {
                                  "display": "Sems 2",
                                  "value": '2',
                                },
                                {
                                  "display": "Sem1",
                                  "value": '2',
                                },
                                {
                                  "display": "Sems 2",
                                  "value": '2',
                                }
                              ],
                              onChanged: (value) {},
                              onSaved: (value) {},
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 15,
                          ),
                        )
                      ],
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
                        Navigator.pop(context);
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
                      child: GradingTable(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//                  SizedBox(
//                    height: 20,
//                  ),
//                  TextFormField(
//                    decoration: kTextFormFieldDecoration,
//                    onChanged: (value) {},
//                    validator: (val) {
//                      if (val.length == 0) {
//                        return "Module Name cannot be empty";
//                      } else {
//                        return null;
//                      }
//                    },
//                  ),
//                  SizedBox(
//                    height: 50,
//                  ),
//                  Row(
//                    children: <Widget>[
//                      Expanded(
//                        child: Container(
//                          child: DropDownFormField(
//                            titleText: 'Semester',
//                            hintText: 'Please choose one',
//                            value: null,
//                            textField: 'display',
//                            dataSource: [
//                              {
//                                "display": "Sem1",
//                                "value": '2',
//                              },
//                              {
//                                "display": "Sems 2",
//                                "value": '2',
//                              },
//                              {
//                                "display": "Sem1",
//                                "value": '2',
//                              },
//                              {
//                                "display": "Sems 2",
//                                "value": '2',
//                              },
//                              {
//                                "display": "Sem1",
//                                "value": '2',
//                              },
//                              {
//                                "display": "Sems 2",
//                                "value": '2',
//                              },
//                              {
//                                "display": "Sem1",
//                                "value": '2',
//                              },
//                              {
//                                "display": "Sems 2",
//                                "value": '2',
//                              }
//                            ],
//                            onChanged: (value) {},
//                            onSaved: (value) {},
//                          ),
//                        ),
//                      ),
//                      SizedBox(
//                        width: 20,
//                      ),
//                      Expanded(
//                        child: Container(
//                          child: DropDownFormField(
//                            titleText: 'Credits',
//                            hintText: 'Please choose one',
//                            value: null,
//                            textField: 'display',
//                            dataSource: [
//                              {
//                                "display": "Sem1",
//                                "value": '2',
//                              },
//                              {
//                                "display": "Sems 2",
//                                "value": '2',
//                              },
//                              {
//                                "display": "Sem1",
//                                "value": '2',
//                              },
//                              {
//                                "display": "Sems 2",
//                                "value": '2',
//                              },
//                              {
//                                "display": "Sem1",
//                                "value": '2',
//                              },
//                              {
//                                "display": "Sems 2",
//                                "value": '2',
//                              },
//                              {
//                                "display": "Sem1",
//                                "value": '2',
//                              },
//                              {
//                                "display": "Sems 2",
//                                "value": '2',
//                              }
//                            ],
//                            onChanged: (value) {},
//                            onSaved: (value) {},
//                          ),
//                        ),
//                      )
//                    ],
//                  ),
//                  SizedBox(
//                    height: 50,
//                  ),
//                  Row(
//                    children: <Widget>[
//                      Expanded(
//                          child: SizedBox(
//                        width: 15,
//                      )),
//                      Expanded(
//                        child: Container(
//                          child: DropDownFormField(
//                            titleText: 'Grade',
//                            hintText: 'Please choose one',
//                            value: null,
//                            textField: 'display',
//                            dataSource: [
//                              {
//                                "display": "Sem1",
//                                "value": '2',
//                              },
//                              {
//                                "display": "Sems 2",
//                                "value": '2',
//                              },
//                              {
//                                "display": "Sem1",
//                                "value": '2',
//                              },
//                              {
//                                "display": "Sems 2",
//                                "value": '2',
//                              },
//                              {
//                                "display": "Sem1",
//                                "value": '2',
//                              },
//                              {
//                                "display": "Sems 2",
//                                "value": '2',
//                              },
//                              {
//                                "display": "Sem1",
//                                "value": '2',
//                              },
//                              {
//                                "display": "Sems 2",
//                                "value": '2',
//                              }
//                            ],
//                            onChanged: (value) {},
//                            onSaved: (value) {},
//                          ),
//                        ),
//                      ),
//                      Expanded(
//                        child: SizedBox(
//                          width: 15,
//                        ),
//                      )
//                    ],
//                  ),
//                  SizedBox(
//                    height: 70,
//                  ),
//                  FlatButton(
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(15)),
//                    padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
//                    color: kPrimaryColor,
//                    onPressed: () {
//                      Navigator.pop(context);
//                    },
//                    child: Text(
//                      'Add Module',
//                      style: TextStyle(color: Colors.white, fontSize: 25),
//                    ),
//                  ),
