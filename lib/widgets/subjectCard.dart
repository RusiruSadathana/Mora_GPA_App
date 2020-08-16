import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mora_gpa/classes/Controller.dart';
import 'package:mora_gpa/constants/colors.dart';
import 'package:mora_gpa/constants/styles.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class SubjectCard extends StatelessWidget {
  SubjectCard({this.subject});

  final Map subject;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.all(10),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        child: ListTile(
          title: Text(
            subject['name'],
            style: TextStyle(
              fontSize: 30,
              letterSpacing: 1.25,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                'Grade   :   ' + subject['grade'],
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Credits :   ' + subject['credits'].toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.trashAlt,
                        size: 25,
                        color: kPrimaryColor,
                      ),
                      onPressed: () {
                        Alert(
                            context: context,
                            title: "Delete !",
                            desc:
                                "Are you sure you want to delete this subject?",
                            style: kalertStyle,
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "Yes",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                onPressed: () {
                                  Controller.deleteModule(subject['name']);
                                  Navigator.pop(context);
                                },
                                color: kPrimaryColor,
                              ),
                              DialogButton(
                                child: Text(
                                  "No",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                color: kPrimaryColor,
                              )
                            ]).show();
                      }),
                ],
              ),
            ],
          ),
          //trailing:
        ),
      ),
    );
  }
}
