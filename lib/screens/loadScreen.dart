import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:mora_gpa/constants/colors.dart';

import 'HomeScreen.dart';

class LoadScreen extends StatefulWidget {
  @override
  _LoadScreenState createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {
  @override
  initState() {
    super.initState();
    new Timer(const Duration(seconds: 3), onClose);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'assets/logo.png',
              width: 250,
              height: 250,
            ),
            Center(
              child: FadeAnimatedTextKit(
                duration: Duration(milliseconds: 3000),
                totalRepeatCount: 1,
                text: ['Mora GPA'],
                textStyle: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 55.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.25),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onClose() {
    Navigator.pushReplacement(
      context,
      new PageRouteBuilder(
        opaque: true,
        pageBuilder: (context, _, __) => HomeScreen(
          initIndex: 0,
        ),
        transitionDuration: const Duration(seconds: 1),
        transitionsBuilder: (context, anim1, anim2, child) {
          return new FadeTransition(
            child: child,
            opacity: anim1,
          );
        },
      ),
    );
  }
}
