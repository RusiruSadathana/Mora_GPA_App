import 'package:flutter/material.dart';
import 'package:mora_gpa/constants/colors.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

var kCardStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(
    Radius.circular(10),
  ),
  boxShadow: [
    BoxShadow(
      offset: Offset(0, 3),
      color: kPrimaryColor, //(x,y)
      blurRadius: 4.0,
    ),
  ],
);
InputDecoration kTextFormFieldDecoration = InputDecoration(
  labelText: "Enter Module Name",
  labelStyle: TextStyle(fontSize: 20),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide(),
  ),
);

var kalertStyle = AlertStyle(
  animationType: AnimationType.fromBottom,
  isCloseButton: true,
  isOverlayTapDismiss: true,
  animationDuration: Duration(milliseconds: 475),
  alertBorder: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),
    side: BorderSide(
      color: Colors.grey,
    ),
  ),
  titleStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
);

const ktableHeaderStyle = TextStyle(
  fontSize: 22,
  letterSpacing: 2,
);

const ktableDataStyle = TextStyle(
  fontSize: 20,
  letterSpacing: 2,
);
